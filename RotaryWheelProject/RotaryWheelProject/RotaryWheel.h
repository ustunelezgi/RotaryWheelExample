//
//  RotaryWheel.h
//  RotaryWheelProject
//
//  Created by Ezgi Ustunel on 2.12.2020.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RotaryWheelDelegate <NSObject>
- (void) wheelDidChangeValue: (NSString *)newValue;
@end

@interface RotaryWheel : UIControl
@property (weak) id <RotaryWheelDelegate> delegate;
@property (nonatomic, strong) UIView *container;
@property int numberOfSections;
- (id) initWithFrame:(CGRect)frame delegate:(id)delegate withSections:(int)sectionsNumber;
@end

NS_ASSUME_NONNULL_END
