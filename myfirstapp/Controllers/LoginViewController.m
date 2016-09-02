//
//  LoginViewController.m
//  myfirstapp
//
//  Created by Sean Heinen on 8/31/16.
//  Copyright © 2016 Sean Heinen. All rights reserved.
//

#import "LoginViewController.h"
#import "UIView+AutoLayout.h"
#import "UIView+Animation.h"
#import "UIButton+Styling.h"

#import "PaddedRoundedTextField.h"

#import "HomeViewController.h"
#import "TutorialViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController {
    
    UIImageView *bgImage;
    UIView *imageOverlay;
    UIImageView *logo;
    UIView *loginView;
    
    PaddedRoundedTextField *usernameView;
    PaddedRoundedTextField *passwordView;
    UIButton *buttonView;
}

- (void)loadView {
    
    [super loadView];
    
    // init views
    [self initViews];
    // set contraints
    [self addConstraints];

}



- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    // do background
    bgImage.image = [UIImage imageNamed:@"login-image-portrait.jpg"];
    imageOverlay.backgroundColor = [UIColor colorWithRed:(95/255.0) green:(136/255.0) blue:(180/255.0) alpha:1];
    imageOverlay.alpha = 0.5;
    
    // render login controls
    logo.image = [UIImage imageNamed:@"logo.png"];
    logo.alpha = 0.5;
    
    usernameView.placeholder = @"Username";
    passwordView.placeholder = @"Password";
    passwordView.secureTextEntry = true;
    
    [buttonView confirmStyling];    
    [buttonView setTitle:@"Login" forState:UIControlStateNormal];
    
    [buttonView addTarget:self
                 action:@selector(loginAction)
       forControlEvents:UIControlEventTouchUpInside];
    
    //set default values
    usernameView.text = @"seanheinen";
    passwordView.text = @"password";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // do navbar things
    [self hideNavbar:true];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initViews {
    
    // init web view
    bgImage = [UIImageView autolayoutView];
    imageOverlay = [UIView autolayoutView];
    logo = [UIImageView autolayoutView];
    loginView = [UIView autolayoutView];
    
    // login panel
    usernameView = [PaddedRoundedTextField autolayoutView];
    passwordView = [PaddedRoundedTextField autolayoutView];
    buttonView = [UIButton autolayoutView];
    
    
    [self.view addSubview:bgImage];
    [self.view addSubview:imageOverlay];
    [self.view addSubview:loginView];
    
    [loginView addSubview:logo];
    [loginView addSubview:usernameView];
    [loginView addSubview:passwordView];
    [loginView addSubview:buttonView];
}

- (void) addConstraints {
    
    // image view
    NSDictionary *imageDictionary = NSDictionaryOfVariableBindings(bgImage);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bgImage]-0-|" options:0 metrics:nil views:imageDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bgImage]-0-|" options:0 metrics:nil views:imageDictionary]];
    
    // overlay view
    NSDictionary *overlayDictionary = NSDictionaryOfVariableBindings(imageOverlay);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[imageOverlay]-0-|" options:0 metrics:nil views:overlayDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[imageOverlay]-0-|" options:0 metrics:nil views:overlayDictionary]];

    // login view
    
    NSDictionary *loginDictionary = NSDictionaryOfVariableBindings(loginView);
    //NSDictionary *metrics = @{@"buttonWidth":@200.0};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[loginView]-0-|" options:0 metrics:nil views:loginDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[loginView]-0-|" options:0 metrics:nil views:loginDictionary]];
     
    // set widths
    NSDictionary *controlsDictionary = NSDictionaryOfVariableBindings(logo, usernameView, passwordView, buttonView);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[logo(200)]" options:0 metrics:nil views:controlsDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[usernameView(200)]" options:0 metrics:nil views:controlsDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[passwordView(usernameView)]" options:0 metrics:nil views:controlsDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[buttonView(200)]" options:0 metrics:nil views:controlsDictionary]];
    
    // vertical spacing from bottom
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[logo(200)]-50-[usernameView(buttonView)]-[passwordView(buttonView)]-[buttonView]-100-|" options:0 metrics:nil views:controlsDictionary]];
    
    // center all controlls horizontally
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:logo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:loginView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:usernameView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:loginView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:passwordView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:loginView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:buttonView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:loginView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    // Do view manipulation here.
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    
    if (size.width > size.height) {
        [logo setHidden:true];
        bgImage.image = [UIImage imageNamed:@"login-image-landscape.jpg"];
    } else {
        [logo setHidden:false];
        bgImage.image = [UIImage imageNamed:@"login-image-portrait.jpg"];
    }
}

- (IBAction)loginAction{
    
    NSString *username = [usernameView text];
    NSString *password = [passwordView text];
    
    if ([username length] < 1 || [password length] < 1) {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
        [animation setDuration:0.1];
        [animation setRepeatCount:3];
        [animation setAutoreverses:YES];
        
        
        [animation setFromValue:[NSValue valueWithCGPoint:
                                 CGPointMake([usernameView center].x - 10.0f, [usernameView center].y)]];
        [animation setToValue:[NSValue valueWithCGPoint:
                               CGPointMake([usernameView center].x + 10.0f, [usernameView center].y)]];
        [[usernameView layer] addAnimation:animation forKey:@"position"];
        
        [animation setFromValue:[NSValue valueWithCGPoint:
                                 CGPointMake([passwordView center].x - 10.0f, [passwordView center].y)]];
        [animation setToValue:[NSValue valueWithCGPoint:
                               CGPointMake([passwordView center].x + 10.0f, [passwordView center].y)]];
        [[passwordView layer] addAnimation:animation forKey:@"position"];
        
        [animation setFromValue:[NSValue valueWithCGPoint:
                                 CGPointMake([buttonView center].x - 10.0f, [buttonView center].y)]];
        [animation setToValue:[NSValue valueWithCGPoint:
                               CGPointMake([buttonView center].x + 10.0f, [buttonView center].y)]];
        [[buttonView layer] addAnimation:animation forKey:@"position"];
        return;
    }
    
    // go to home
    //HomeViewController *home = [[HomeViewController alloc] init];
    //[self.navigationController pushViewController:home animated:true];
    
    TutorialViewController *tut = [[TutorialViewController alloc] init];
    [self.navigationController pushViewController:tut animated:true];
    
    //[buttonView moveTo:CGPointMake(buttonView.frame.origin.x, loginView.frame.origin.y) duration:1.0 option:0];
    //[buttonView moveTo:CGPointMake(buttonView.frame.origin.x, buttonView.frame.origin.y) duration:1.0 option:0]
}


@end
