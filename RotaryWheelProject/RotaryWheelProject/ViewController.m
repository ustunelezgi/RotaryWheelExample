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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RotaryWheel *wheel = [[RotaryWheel alloc] initWithFrame:CGRectMake(50, 100, 200, 200)
                                                    andDelegate:self
                                                   withSections:8];
    // 3 - Add wheel to view
    [self.view addSubview:wheel];
}


@end
