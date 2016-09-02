//
//  TutorialChildViewController.h
//  myfirstapp
//
//  Created by Sean Heinen on 9/2/16.
//  Copyright © 2016 Sean Heinen. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UA_RGBA(r,g,b,a)    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

@interface TutorialChildViewController : UIPageViewController

@property (assign, nonatomic) NSInteger index;
@property (strong, nonatomic) NSArray *pageContent;

@end
