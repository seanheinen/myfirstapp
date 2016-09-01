//
//  UIButton+Styling.m
//  myfirstapp
//
//  Created by Sean Heinen on 9/1/16.
//  Copyright © 2016 Sean Heinen. All rights reserved.
//

#import "UIButton+Styling.h"

@implementation UIButton (Styling)

- (void) confirmStyling{
    
    [self.layer setCornerRadius:8.0f];
    
    self.backgroundColor = [UIColor colorWithRed:(0/255.0) green:(150/255.0) blue:(136/255.0) alpha:1];
    
    
    
}

- (void) rejectStyling{
    
    [self.layer setCornerRadius:8.0f];
    
    self.backgroundColor = [UIColor redColor];
}
@end
