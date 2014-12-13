//
//  MapViewController.m
//  Mapkit Custom Callouts
//
//  Created by Philippe Willis on 12/12/14.
//  Copyright (c) 2014 Philippe Willis. All rights reserved.
//
#define LAT 45.5200
#define LNG -122.6819


#import "MapViewController.h"

@interface MapViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic)  WYPopoverController *popover;
@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    // load the map
    [self loadMap];
    
    [self addMarker];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Map Stuff

-(void)loadMap
{
    // set the delegate to get callbacks
    [self.mapView setDelegate:self];
    
    // center coordinate
    CLLocationCoordinate2D mapCenter;
    mapCenter.latitude = LAT;
    mapCenter.longitude = LNG;
    
    // map's span
    MKCoordinateSpan span;
    span.latitudeDelta = 1; // 1 degree
    span.longitudeDelta = 1;
    
    // maps's region
    MKCoordinateRegion region;
    region.center = mapCenter;
    region.span = span;
    
    [self.mapView setRegion:region animated:YES];
}


-(void)addMarker
{
    NSLog(@"....at marker");
    
    // marker coordinate
    CLLocationCoordinate2D mapCenter;
    mapCenter.latitude = LAT;
    mapCenter.longitude = LNG;

    // create a marker
    self.myMarker = [[PWAnnotation alloc] initWithPosition:mapCenter];
    self.myMarker.title = @"Hello this is a callout!!";
    
    // add annotation to map
    [self.mapView addAnnotation:self.myMarker];
}







- (MKAnnotationView *)mapView:(MKMapView *)mapView
            viewForAnnotation:(id <MKAnnotation>)annotation
{
    static NSString *const MyAnnotationViewReuseID = @"MyAnnotationViewReuseID";
    
    PWAnnotationView *annotationView = (PWAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:MyAnnotationViewReuseID];
    
    if (!annotationView) {
        annotationView = [[PWAnnotationView alloc] initWithAnnotation:annotation
                                                      reuseIdentifier:MyAnnotationViewReuseID];
    }
    
    // MKAnnotationView's image property corresponds to the marker on the map
    UIImage *flagImage = [UIImage imageNamed:@"map-marker.png"];
    annotationView.image = flagImage;
    
    // Disable the default callout: we'll handle it on our own
    annotationView.canShowCallout = NO;
    
    return annotationView;
}

- (void)mapView:(MKMapView *)mapView
didSelectAnnotationView:(MKAnnotationView *)view
{
    // Our popover handles deselection so tell the map view we'll take care of it
    [mapView deselectAnnotation:view.annotation animated:YES];
    
    if([view isKindOfClass:PWAnnotationView.class]) {
        
        // Start up our view controller from a Storyboard
        UIViewController* controller = (UIViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"MyCustomPopoverIdentifier"];
        
        // Adjust this property to change the size of the popover + content
        controller.preferredContentSize = CGSizeMake(150, 80);
        
        if(!self.popover) {
            self.popover = [[WYPopoverController alloc] initWithContentViewController:controller];
            
            // Using WYPopoverController's iOS 6 theme
            self.popover.theme = [WYPopoverTheme themeForIOS6];
        }
        
        //POPOVER
        [self.popover presentPopoverFromRect:view.bounds
                                      inView:view
                    permittedArrowDirections:WYPopoverArrowDirectionDown
                                    animated:TRUE
                                     options:WYPopoverAnimationOptionFadeWithScale];
    }
}




@end
