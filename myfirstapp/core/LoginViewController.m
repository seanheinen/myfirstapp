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

@interface LoginViewController ()

@end

@implementation LoginViewController {
    
    UIImageView *bgImage;
    UIView *imageOverlay;
    UIView *loginView;
    
    UITextField *usernameView;
    UITextField *passwordView;
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
    
    // do navbar things
    [self setNavTitle:@"Login"];
    [self hideNavbar:true];
    
    // do background
    bgImage.image = [UIImage imageNamed:@"login-image.png"];
    imageOverlay.backgroundColor = [UIColor colorWithRed:(95/255.0) green:(136/255.0) blue:(180/255.0) alpha:1];
    imageOverlay.alpha = 0.4;
    
    // render login controls
    usernameView.backgroundColor = [UIColor redColor];
    usernameView.placeholder = @"Username";
    
    passwordView.backgroundColor = [UIColor redColor];
    passwordView.placeholder = @"Password";
    passwordView.secureTextEntry = true;
    
    buttonView.backgroundColor = [UIColor redColor];
    [buttonView setTitle:@"Login" forState:UIControlStateNormal];
    
    
    [buttonView addTarget:self
                 action:@selector(loginAction)
       forControlEvents:UIControlEventTouchUpInside];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initViews {
    
    // init web view
    bgImage = [UIImageView autolayoutView];
    imageOverlay = [UIView autolayoutView];
    loginView = [UIView autolayoutView];
    
    // login panel
    usernameView = [UITextField autolayoutView];
    passwordView = [UITextField autolayoutView];
    buttonView = [UIButton autolayoutView];
    
    
    [self.view addSubview:bgImage];
    [self.view addSubview:imageOverlay];
    [self.view addSubview:loginView];
    
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
     

    // controller
    NSDictionary *usernameDictionary = NSDictionaryOfVariableBindings(loginView, usernameView, passwordView, buttonView);
    
    // set same widths
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[usernameView(200)][passwordView(usernameView)][buttonView(usernameView)]" options:0 metrics:nil views:usernameDictionary]];
    
    // vertical spacing
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[usernameView(buttonView)]-[passwordView(buttonView)]-[buttonView]-100-|" options:0 metrics:nil views:usernameDictionary]];
    
    // center all three controlls
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:usernameView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:loginView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:passwordView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:loginView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:buttonView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:loginView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    
}


- (IBAction)loginAction{
    
    NSString *username = [usernameView text];
    NSString *password = [passwordView text];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setDuration:0.1];
    [animation setRepeatCount:3];
    [animation setAutoreverses:YES];
    [animation setFromValue:[NSValue valueWithCGPoint:
                             CGPointMake([buttonView center].x - 10.0f, [buttonView center].y)]];
    [animation setToValue:[NSValue valueWithCGPoint:
                           CGPointMake([buttonView center].x + 10.0f, [buttonView center].y)]];
    [[buttonView layer] addAnimation:animation forKey:@"position"];
    
    return;
    
    [buttonView moveTo:CGPointMake(buttonView.frame.origin.x, loginView.frame.origin.y) duration:1.0 option:0];
    [buttonView moveTo:CGPointMake(buttonView.frame.origin.x, buttonView.frame.origin.y) duration:1.0 option:0];
    
}


@end
