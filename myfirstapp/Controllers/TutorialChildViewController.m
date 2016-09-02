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
    UIView *backgroundView;
}

- (void)loadView {
    [super loadView];
    
    [self initViews];
    [self addConstraints];
}
- (void)initViews {
    _screenNumber = [UILabel autolayoutView];
    
    [self.view addSubview:_screenNumber];
}
- (void)addConstraints {
    NSDictionary *labelDictionary = NSDictionaryOfVariableBindings(_screenNumber);
    //NSDictionary *metrics = @{@"buttonWidth":@200.0};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[_screenNumber]-100-|" options:0 metrics:nil views:labelDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_screenNumber]" options:0 metrics:nil views:labelDictionary]];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor greenColor];
    
    self.screenNumber.text = [NSString stringWithFormat:@"Screen #%ld", self.index];
}

@end
