//
//  MapViewController.h
//  Mapkit Custom Callouts
//
//  Created by Philippe Willis on 12/12/14.
//  Copyright (c) 2014 Philippe Willis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "PWAnnotation.h"
#import "PWAnnotationView.h"
#import "WYPopoverController.h"

@interface MapViewController : UIViewController <MKMapViewDelegate>
@property (nonatomic,strong)PWAnnotation *myMarker;
@property CLLocationCoordinate2D coordinates;
@end
