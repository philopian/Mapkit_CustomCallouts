//
//  PWAnnotationView.m
//  OuterPowell
//
//  Created by Philippe Willis on 12/7/14.
//  Copyright (c) 2014 Philippe Willis. All rights reserved.
//

#import "PWAnnotationView.h"
#import "PWAnnotation.h"

@implementation PWAnnotationView


- (id)initWithAnnotation:(id<MKAnnotation>)annotation
         reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    
    // marker icon
    self.image = [UIImage imageNamed:@"map-marker.png"];
    
    self.enabled = YES;
    self.canShowCallout = NO;//we want to disable the callout cause we will handle it with the WYPopoverController
    
    return self;
}
@end