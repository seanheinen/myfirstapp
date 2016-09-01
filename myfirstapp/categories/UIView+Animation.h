//
//  UIView+Animation.h
//  myfirstapp
//
//  Created by Sean Heinen on 9/1/16.
//  Copyright © 2016 Sean Heinen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Animation)
- (void) moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option;
@end
