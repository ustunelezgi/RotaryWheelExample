//
//  RotaryWheel.m
//  RotaryWheelProject
//
//  Created by Ezgi Ustunel on 2.12.2020.
//

#import "RotaryWheel.h"
#import <QuartzCore/QuartzCore.h>
#import "Sector.h"

@interface RotaryWheel ()
- (void)drawWheel;
@end

static float deltaAngle;

@implementation RotaryWheel {
    NSInteger counter;
    UIImageView *im;
}

@synthesize startTransform;
@synthesize delegate, container, numberOfSections;
@synthesize sectors;
@synthesize currentSector;


- (id) initWithFrame:(CGRect)frame andDelegate:(id)del withSections:(int)sectionsNumber {
    if ((self = [super initWithFrame:frame])) {
        self.numberOfSections = sectionsNumber;
        delegate = del;
        //self.currentSector = 0;
        [self drawWheel];
        //[self rotate];
    }
    counter = 0;
    
    return self;
}

// an ivar for your class:
BOOL animating;

- (void)spinWithOptions:(UIViewAnimationOptions)options duration:(float)duration {
    // this spin completes 360 degrees every 2 seconds
    [UIView animateWithDuration:duration
                          delay:0
                        options:options
                     animations:^{
        self->im.transform = CGAffineTransformRotate(self->im.transform, M_PI / 2);
    }
                     completion:^(BOOL finished) {
        if (finished) {
            if (animating) {
                // if flag still set, keep spinning with constant speed
                [self spinWithOptions:UIViewAnimationOptionCurveLinear duration:duration];
            } else if (options != UIViewAnimationOptionCurveEaseOut) {
                // one last spin, with deceleration
                [self spinWithOptions: UIViewAnimationOptionCurveEaseOut duration:2.0];
            }
        }
    }];
    
}

- (void)startSpin {
    if (!animating) {
        animating = YES;
        [self spinWithOptions: UIViewAnimationOptionCurveEaseIn duration:0.3];
    }
}

- (void)continueSpin {
    if (!animating) {
        animating = YES;
        [self spinWithOptions: UIViewAnimationOptionCurveEaseIn duration:0.5];
    }
}

- (void)stopSpin {
    // set the flag to stop spinning after one last 90 degree increment
    animating = NO;
    
}

- (void)drawWheel {
    container = [[UIView alloc] initWithFrame:self.frame];
    CGFloat angleSize = 2*M_PI/numberOfSections;
    
    container.userInteractionEnabled = NO;
    
    [self addSubview:container];
    
    im = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wheel"]];
    im.frame = CGRectMake(container.center.x, container.center.y, 277, 283);
    im.layer.position = CGPointMake(container.bounds.size.width/2.0,
                                    container.bounds.size.height/2.0);
    
    [container addSubview:im];
    
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchPoint = [touch locationInView:self];
    float dx = touchPoint.x - im.center.x;
    float dy = touchPoint.y - im.center.y;
    deltaAngle = atan2(dy, dx);
    startTransform = im.transform;
    
    [self startSpin];
    
    return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    
    CGFloat radians = atan2f(container.transform.b, container.transform.a);
    //NSLog(@"rad is %f", radians);
    CGPoint pt = [touch locationInView:self];
    float dx = pt.x  - im.center.x;
    float dy = pt.y  - im.center.y;
    float ang = atan2(dy,dx);
    NSLog(@"angle: %f", ang);
    float angleDifference = deltaAngle - ang;
    
    double delayInSeconds = 5.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self stopSpin];
    });
    
    return YES;
}

@end
