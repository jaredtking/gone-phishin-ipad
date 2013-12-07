//
//  GPMainViewController.m
//  Gone Phishin'
//
//  Created by wolverine on 11/15/13.
//  Copyright (c) 2013 wolverine. All rights reserved.
//

#import "GPLandingViewController.h"

@implementation GPLandingViewController

@synthesize helloLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:BACKGROUND_COLOR];
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    helloLabel = [[UILabel alloc] init];
    helloLabel.text = @"Hello world!";
    helloLabel.font = [UIFont systemFontOfSize:36.0];
    [self.view addSubview:helloLabel];
}

- (UIStatusBarStyle) preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
