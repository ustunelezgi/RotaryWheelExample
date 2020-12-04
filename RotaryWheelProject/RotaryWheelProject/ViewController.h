//
//  ViewController.h
//  RotaryWheelProject
//
//  Created by Ezgi Ustunel on 2.12.2020.
//

#import <UIKit/UIKit.h>
#import "RotaryWheel.h"

@interface ViewController : UIViewController <RotaryWheelDelegate>
@property (nonatomic, strong) UILabel *sectorLabel;
@end

