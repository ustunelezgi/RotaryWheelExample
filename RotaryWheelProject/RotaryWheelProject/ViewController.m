//
//  ViewController.m
//  RotaryWheelProject
//
//  Created by Ezgi Ustunel on 2.12.2020.
//

#import "ViewController.h"
#import "RotaryWheel.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize sectorLabel;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1 - Call super method
    [super viewDidLoad];
    // 2 - Create sector label
    //sectorLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 400, 120, 30)];
    //sectorLabel.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:sectorLabel];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    // 3 - Set up rotary wheel
    RotaryWheel *wheel = [[RotaryWheel alloc] initWithFrame:CGRectMake(self.view.center.x/6, self.view.center.y/4, 200, 200)
                                                delegate:self
                                               withSections:0];
    wheel.center = CGPointMake(160, 240);
    // 4 - Add wheel to view
    [self.view addSubview:wheel];
}

- (void)wheelDidChangeValue:(nonnull NSString *)newValue {
    self.sectorLabel.text = newValue;
}

@end
