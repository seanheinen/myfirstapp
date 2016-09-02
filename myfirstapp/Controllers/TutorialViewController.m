//
//  TutorialViewController.m
//  myfirstapp
//
//  Created by Sean Heinen on 9/2/16.
//  Copyright © 2016 Sean Heinen. All rights reserved.
//

#import "TutorialViewController.h"
#import "TutorialChildViewController.h"
#import "UIView+AutoLayout.h"

@interface TutorialViewController ()

@end

@implementation TutorialViewController {
    NSArray *pageContent;
}

- (void)loadView {
    [super loadView];
    
    [self initViews];
    [self formatViews];
    [self viewContraints];
    [self createContentPages];
}

- (void)initViews {
}
- (void)formatViews {
    self.view.backgroundColor = UA_RGBA(95,136,180,0.5);
}
- (void)viewContraints {
}

- (void) createContentPages{
    
    pageContent = [NSArray arrayWithObjects:
                   @"This is step one",
                   @"This is step two",
                   @"This is step three",
                   @"This is step four",
                   @"This is step five",
                   nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // instantiate pagecontroller with horizontal animation swipe
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource = self;
    [[self.pageController view] setFrame:[[self view] bounds]];
    
    // instatiate child controller and set initial
    TutorialChildViewController *initialViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
    
}

// UIPageViewControllerDataSource required protocol
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    NSUInteger index = [(TutorialChildViewController *)viewController index];
    if (index == 0) {
        return nil;
    }
    index--;
    
    return [self viewControllerAtIndex:index];
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    NSUInteger index = [(TutorialChildViewController *)viewController index];
    
    index++;
    if (index == 5) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
}

- (TutorialChildViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    TutorialChildViewController *childViewController = [[TutorialChildViewController alloc] initWithNibName:@"TutorialChildViewController" bundle:nil];
    childViewController.index = index;
    childViewController.pageContent = pageContent;
    
    return childViewController;
}

// UIPageViewControllerDataSource optional protocol
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return 5;
}
- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
