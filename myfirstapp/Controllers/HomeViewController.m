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
    
    [self initViews];
    [self formatViews];
    [self viewConstraints];
}

- (void)initViews {
    backgroundView = [UIView autolayoutView];
    myList = [UITableView autolayoutView];
    
    myList.delegate = self;
    myList.dataSource = self;
    
    [self.view addSubview:backgroundView];
    [backgroundView addSubview:myList];
}

- (void)formatViews {
}

- (void)viewConstraints {
    
    NSDictionary *backgroundDictionary = NSDictionaryOfVariableBindings(backgroundView);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[backgroundView]-0-|" options:0 metrics:nil views:backgroundDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[backgroundView]-0-|" options:0 metrics:nil views:backgroundDictionary]];
    
    NSDictionary *listDictionary = NSDictionaryOfVariableBindings(myList);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[myList]-0-|" options:0 metrics:nil views:listDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[myList]-0-|" options:0 metrics:nil views:listDictionary]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self getData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self setNavTitle:@"Home"];
    [self hideNavbar:false];
}

- (void) getData{
    
    NSURL *url = [NSURL URLWithString:@"http://jsonplaceholder.typicode.com/posts"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    // define request
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        tableData = (NSArray *)responseObject;
        [myList reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                            message:[error localizedDescription]
                                                            delegate:nil
                                                            cancelButtonTitle:@"Ok"
                                                            otherButtonTitles:nil];
        [alertView show];
    }];
    
    [operation start];
}

// UITableViewDataSource required protocol
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

// UITableViewDelegate optional protocol
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Item number %ld selected from list", indexPath.row);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
