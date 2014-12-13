#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface PWAnnotation : NSObject <MKAnnotation>
// default properties
@property (nonatomic,assign) CLLocationCoordinate2D coordinate;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *subtitle;

// additional properties
@property (nonatomic,copy) NSString *type;
@property (nonatomic,copy) NSString *name;


// Make it so you have to initialize the coordinate (so you don't forget)
-initWithPosition:(CLLocationCoordinate2D)coords;
@end
