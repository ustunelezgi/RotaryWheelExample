//
//  RotaryWheel.m
//  RotaryWheelProject
//
//  Created by Ezgi Ustunel on 2.12.2020.
//

#import "RotaryWheel.h"
#import <QuartzCore/QuartzCore.h>

@interface RotaryWheel ()
- (void)drawWheel;
@end

static float deltaAngle;

@implementation RotaryWheel

@synthesize startTransform;
@synthesize delegate, container, numberOfSections;

- (id) initWithFrame:(CGRect)frame andDelegate:(id)del withSections:(int)sectionsNumber {
    if ((self = [super initWithFrame:frame])) {
        self.numberOfSections = sectionsNumber;
        self.delegate = del;
        [self drawWheel];
        [self rotate];
    }
    
    [NSTimer scheduledTimerWithTimeInterval:0.2
                                     target:self
                                   selector:@selector(rotate)
                                   userInfo:nil
                                    repeats:YES];
    return self;
}

- (void)drawWheel {
    container = [[UIView alloc] initWithFrame:self.frame];
    CGFloat angleSize = 2*M_PI/numberOfSections;
    
    for (int i = 0; i < numberOfSections; i++) {
        UILabel *im = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        im.backgroundColor = [UIColor redColor];
        im.text = [NSString stringWithFormat:@"%i", i];
        im.layer.anchorPoint = CGPointMake(1.0f, 0.5f);
        im.layer.position = CGPointMake(container.bounds.size.width/2.0,
                                        container.bounds.size.height/2.0);
        im.transform = CGAffineTransformMakeRotation(angleSize * i);
        im.tag = i;
        [container addSubview:im];
    }
    container.userInteractionEnabled = NO;
    [self addSubview:container];
}

- (void)rotate {
    CGAffineTransform t = CGAffineTransformRotate(container.transform, -0.30);
    container.transform = t;
}

@end
