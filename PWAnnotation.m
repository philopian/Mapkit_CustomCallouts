#import "PWAnnotation.h"

@implementation PWAnnotation

-initWithPosition:(CLLocationCoordinate2D)coords
{
    if (self = [super init]) {
        self.coordinate = coords;
    }
    return self;
}
@end
