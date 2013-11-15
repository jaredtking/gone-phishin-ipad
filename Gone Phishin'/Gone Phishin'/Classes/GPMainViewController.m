//
//  GPMainViewController.m
//  Gone Phishin'
//
//  Created by wolverine on 11/15/13.
//  Copyright (c) 2013 wolverine. All rights reserved.
//

#import "GPMainViewController.h"

@implementation GPMainViewController

@synthesize helloLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    helloLabel = [[UILabel alloc] init];
    helloLabel.text = @"Hello world!";
    helloLabel.font = [UIFont systemFontOfSize:36.0];
    [self.view addSubview:helloLabel];
}

- (void)viewWillLayoutSubviews
{
    helloLabel.frame = CGRectMake(100, 10, 320, 26);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
