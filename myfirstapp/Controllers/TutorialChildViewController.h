//
//  TutorialChildViewController.h
//  myfirstapp
//
//  Created by Sean Heinen on 9/2/16.
//  Copyright © 2016 Sean Heinen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialChildViewController : UIPageViewController

@property (assign, nonatomic) NSInteger index;
@property (strong, nonatomic) UILabel *screenNumber;

@end
