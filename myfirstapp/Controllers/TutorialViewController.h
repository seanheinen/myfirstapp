//
//  TutorialViewController.h
//  myfirstapp
//
//  Created by Sean Heinen on 9/2/16.
//  Copyright © 2016 Sean Heinen. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseViewController.h"

@interface TutorialViewController : BaseViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageController;

@end
