//
//  MapViewController.m
//  Mapkit Custom Callouts
//
//  Created by Philippe Willis on 12/12/14.
//  Copyright (c) 2014 Philippe Willis. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    // load the map
    [self loadMap];
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
    mapCenter.latitude = 45.5200;
    mapCenter.longitude = -122.6819;
    
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



@end
