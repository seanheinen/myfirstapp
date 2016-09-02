//
//  BaseViewController.h
//  myfirstapp
//
//  Created by Sean Heinen on 8/31/16.
//  Copyright © 2016 Sean Heinen. All rights reserved.
//

#import <UIKit/UIKit.h>


// Colors
#define UA_RGBA(r,g,b,a)    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define UA_RGB(r,g,b)       UA_RGBA(r, g, b, 1.0f)

@interface BaseViewController : UIViewController

// nav stuff
- (void)setNavTitle:(NSString*) string;
- (void)hideNavbar:(BOOL) hidden;




@end
