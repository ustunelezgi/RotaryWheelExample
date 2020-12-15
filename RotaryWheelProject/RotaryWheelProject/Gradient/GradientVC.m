//
//  GradientVC.m
//  RotaryWheelProject
//
//  Created by Ezgi Ustunel on 10.12.2020.
//

#import "GradientVC.h"

@interface GradientVC ()

@end

@implementation GradientVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = view.bounds;
    gradient.startPoint = CGPointZero;
    gradient.endPoint = CGPointMake(1, 1);
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:34.0/255.0 green:211/255.0 blue:198/255.0 alpha:1.0] CGColor],(id)[[UIColor colorWithRed:145/255.0 green:72.0/255.0 blue:203/255.0 alpha:1.0] CGColor], nil];
    [view.layer addSublayer:gradient];
    [self.view addSubview:view];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
