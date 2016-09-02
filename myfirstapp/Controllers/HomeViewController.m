//
//  HomeViewController.m
//  myfirstapp
//
//  Created by Sean Heinen on 9/1/16.
//  Copyright © 2016 Sean Heinen. All rights reserved.
//

#import "HomeViewController.h"
#import "UIView+AutoLayout.h"

#import <AFNetworking.h>

@interface HomeViewController ()

@end

@implementation HomeViewController{
    UIView *backgroundView;
    
    NSDictionary *listData;
    
    NSArray *tableData;
    
    UITableView *myList;
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
    backgroundView.backgroundColor = [UIColor colorWithRed:(95/255.0) green:(136/255.0) blue:(180/255.0) alpha:1];
    

    //[self fetchGreeting];
    
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // do navbar things
    [self setNavTitle:@"Home"];
    [self hideNavbar:false];
    
}


- (void) fetchGreeting{
    
    NSURL *url = [NSURL URLWithString:@"http://jsonplaceholder.typicode.com/posts"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        // success
        tableData = (NSArray *)responseObject;
        [self loadList];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //error
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
    
    [operation start];
    
}

- (void) loadList{
    [myList reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    NSDictionary * dict = [tableData objectAtIndex:indexPath.row];
    cell.textLabel.text = dict[@"title"] ;
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"Item number %ld selected from list", indexPath.row);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initViews{
    
    backgroundView = [UIView autolayoutView];
    myList = [UITableView autolayoutView];
    
    myList.delegate = self;
    myList.dataSource = self;
    
    [self.view addSubview:backgroundView];
    [backgroundView addSubview:myList];
    
}

- (void)addConstraints{
    
    
    NSDictionary *backgroundDictionary = NSDictionaryOfVariableBindings(backgroundView);
    //NSDictionary *metrics = @{@"buttonWidth":@200.0};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[backgroundView]-0-|" options:0 metrics:nil views:backgroundDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[backgroundView]-0-|" options:0 metrics:nil views:backgroundDictionary]];

    
    NSDictionary *listDictionary = NSDictionaryOfVariableBindings(myList);
    //NSDictionary *metrics = @{@"buttonWidth":@200.0};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[myList]-0-|" options:0 metrics:nil views:listDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[myList]-0-|" options:0 metrics:nil views:listDictionary]];
}

@end
