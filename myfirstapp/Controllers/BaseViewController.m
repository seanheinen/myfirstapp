//
//  BaseViewController.m
//  myfirstapp
//
//  Created by Sean Heinen on 8/31/16.
//  Copyright © 2016 Sean Heinen. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // do nav bar things
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:(95/255.0) green:(136/255.0) blue:(180/255.0) alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];

}

// navbar
- (void)setNavTitle:(NSString*) string {
    self.navigationItem.title = string;
}

- (void)hideNavbar:(BOOL)hidden {
    [[self navigationController] setNavigationBarHidden:hidden];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
