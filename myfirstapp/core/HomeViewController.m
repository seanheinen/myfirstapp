//
//  HomeViewController.m
//  myfirstapp
//
//  Created by Sean Heinen on 9/1/16.
//  Copyright © 2016 Sean Heinen. All rights reserved.
//

#import "HomeViewController.h"
#import "UIView+AutoLayout.h"

@interface HomeViewController ()

@end

@implementation HomeViewController{
    UIView *backgroundView;
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
    [self setNavTitle:@"Home"];
    [self hideNavbar:false];
    
    // do background
    //bgImage.image = [UIImage imageNamed:@"login-image-portrait.jpg"];
    backgroundView.backgroundColor = [UIColor colorWithRed:(95/255.0) green:(136/255.0) blue:(180/255.0) alpha:1];
    //imageOverlay.alpha = 0.5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initViews{
    
    backgroundView = [UIView autolayoutView];
    
    
    [self.view addSubview:backgroundView];
    
}

- (void)addConstraints{
    
    
    NSDictionary *backgroundDictionary = NSDictionaryOfVariableBindings(backgroundView);
    //NSDictionary *metrics = @{@"buttonWidth":@200.0};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[backgroundView]-0-|" options:0 metrics:nil views:backgroundDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[backgroundView]-0-|" options:0 metrics:nil views:backgroundDictionary]];
    
}

@end
