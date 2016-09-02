//
//  PaddedRoundedTextField.m
//  myfirstapp
//
//  Created by Sean Heinen on 9/1/16.
//  Copyright © 2016 Sean Heinen. All rights reserved.
//

#import "PaddedRoundedTextField.h"

@implementation PaddedRoundedTextField

- (id)init {
    
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.textColor = [UIColor blackColor];
        
        [self.layer setCornerRadius:8.0f];
    }
    return self;
    
}



- (CGRect)textRectForBounds:(CGRect)bounds {
    
    return CGRectMake(bounds.origin.x + 10, bounds.origin.y + 8,
                      bounds.size.width - 20, bounds.size.height - 16);
}
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return [self textRectForBounds:bounds];
}

@end
