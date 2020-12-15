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

@implementation RotaryWheel {
    UIImageView *im;
    BOOL animating;
}

@synthesize delegate, container, numberOfSections;

- (id) initWithFrame:(CGRect)frame delegate:(id)delegate withSections:(int)sectionsNumber {
    if ((self = [super initWithFrame:frame])) {
        self.numberOfSections = sectionsNumber;
        delegate = delegate;
        [self drawWheel];
    }
    return self;
}

- (void)spinWithOptions:(UIViewAnimationOptions)options duration:(float)duration {
    [UIView animateWithDuration:duration
                          delay:0
                        options:options
                     animations:^{
        self->im.transform = CGAffineTransformRotate(self->im.transform, M_PI / 2);
    }
                     completion:^(BOOL finished) {
        if (finished) {
            if (self->animating) {
                [self spinWithOptions:UIViewAnimationOptionCurveLinear duration:duration];
            } else if (options != UIViewAnimationOptionCurveEaseOut) {
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

- (void)stopSpin {
    animating = NO;
}

- (void)drawWheel {
    container = [[UIView alloc] initWithFrame:self.frame];
    container.userInteractionEnabled = NO;
    
    [self addSubview:container];
    
    im = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wheel"]];
    im.frame = CGRectMake(container.center.x, container.center.y, 277, 283);
    im.layer.anchorPoint = CGPointMake(0.5f, 0.5f);
    im.layer.position = CGPointMake(container.bounds.size.width/2.0, container.bounds.size.height/2.0);
    im.tag = 1;
    [container addSubview:im];
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [self startSpin];
    
    double delayInSeconds = 5.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self stopSpin];
    });
    
    return YES;
}

@end
