//
//  Sector.m
//  RotaryWheelProject
//
//  Created by Ezgi Üstünel on 3.12.2020.
//

#import "Sector.h"

@implementation Sector

@synthesize minValue, maxValue, midValue, sector;

- (NSString *) description {
    return [NSString stringWithFormat:@"%i | %f, %f, %f", self.sector, self.minValue, self.midValue, self.maxValue];
}
@end
