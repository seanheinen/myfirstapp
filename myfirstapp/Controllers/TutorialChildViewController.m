//
//  TutorialChildViewController.m
//  myfirstapp
//
//  Created by Sean Heinen on 9/2/16.
//  Copyright © 2016 Sean Heinen. All rights reserved.
//

#import "TutorialChildViewController.h"
#import "UIView+AutoLayout.h"

@interface TutorialChildViewController ()
    
@end

@implementation TutorialChildViewController {
    UIImageView *backgroundImageView;
    UIView *backgroundOverlayView;
    UILabel *tutorialLabel;
}

- (void)loadView {
    [super loadView];
    
    [self initViews];
    [self formatViews];
    [self viewConstraints];
}

- (void)initViews {
    backgroundImageView = [UIImageView autolayoutView];
    backgroundOverlayView = [UIView autolayoutView];
    tutorialLabel = [UILabel autolayoutView];
    
    [self.view addSubview:backgroundImageView];
    [self.view addSubview:backgroundOverlayView];
    [self.view addSubview:tutorialLabel];
}

- (void)formatViews {
    self.view.backgroundColor = UA_RGBA(95,136,180,0.5);    
    tutorialLabel.text = [_pageContent objectAtIndex:self.index];
}

- (void)viewConstraints {
    NSDictionary *imageDictionary = NSDictionaryOfVariableBindings(backgroundImageView);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[backgroundImageView]-0-|" options:0 metrics:nil views:imageDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[backgroundImageView]-0-|" options:0 metrics:nil views:imageDictionary]];
                               
    NSDictionary *overlayDictionary = NSDictionaryOfVariableBindings(backgroundOverlayView);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[backgroundOverlayView]-0-|" options:0 metrics:nil views:overlayDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[backgroundOverlayView]-0-|" options:0 metrics:nil views:overlayDictionary]];
    
    NSDictionary *labelDictionary = NSDictionaryOfVariableBindings(tutorialLabel);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[tutorialLabel]-100-|" options:0 metrics:nil views:labelDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[tutorialLabel]" options:0 metrics:nil views:labelDictionary]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidLoad];
    // Do any additional setup after loading the view appears.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
