//
//  GPContentItemViewController.m
//  Gone Phishing
//
//  Created by wolverine on 12/7/13.
//  Copyright (c) 2013 wolverine. All rights reserved.
//

#import "GPContentItemViewController.h"

@implementation GPContentItemViewController

@synthesize trustLabel;
@synthesize trustButton;
@synthesize dontTrustButton;
@synthesize cItemView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:BACKGROUND_COLOR];
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    [self setNeedsStatusBarAppearanceUpdate];
#else
#endif
	
    // instantiate UI elements here
    trustLabel = [[UILabel alloc] init];
    trustLabel.text = @"Do you trust this?";
    trustLabel.font = [UIFont fontWithName:MARKER_FONT size:30.0];
    trustLabel.textColor = BLUETEXT_COLOR;
    trustLabel.backgroundColor = [UIColor clearColor];
    trustLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:trustLabel];
    
    trustButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [trustButton setTitle:@"Trust" forState:UIControlStateNormal];
    trustButton.titleLabel.font =[UIFont fontWithName:DEFAULT_FONT size:24.0];
//    [trustButton setFont:[UIFont fontWithName:DEFAULT_FONT size:24.0]];
    [trustButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [trustButton setBackgroundImage:GREEN_BUTTON_IMAGE forState:UIControlStateNormal];
    [trustButton addTarget:self action:@selector(trustButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:trustButton];

    dontTrustButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [dontTrustButton setTitle:@"Don't trust" forState:UIControlStateNormal];
    dontTrustButton.titleLabel.font =[UIFont fontWithName:DEFAULT_FONT size:24.0];
    //    [trustButton setFont:[UIFont fontWithName:DEFAULT_FONT size:24.0]];
    [dontTrustButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [dontTrustButton setBackgroundImage:RED_BUTTON_IMAGE forState:UIControlStateNormal];
    [dontTrustButton addTarget:self action:@selector(dontTrustButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dontTrustButton];
    
    // logo
    UIImage *content = [UIImage imageNamed:@"cItem1.png"];
    cItemView = [[UIImageView alloc] initWithImage:content];
    cItemView.contentMode = UIViewContentModeCenter;
    [self.view addSubview:cItemView];
}

- (void)viewWillLayoutSubviews
{
    // position UI elements here
    trustLabel.frame = CGRectMake((1024-400)/2, 50, 400, 44);
    trustButton.frame = CGRectMake(1024/2 - 310, 600, 300, 44);
    dontTrustButton.frame = CGRectMake(1024/2 + 10, 600, 300, 44);
    CGRect frame = cItemView.frame;
    UIImage *content = [UIImage imageNamed:@"cItem1.png"];
    frame.origin.x = ((1024-content.size.width) / 2);
    frame.origin.y = ((750-content.size.height) / 2);
    frame.size.width = content.size.width;
    frame.size.height = content.size.height;
    cItemView.frame = frame;
}

- (void)trustButtonPressed:(id)sender
{
    // switch view to quiz results
    GPQuizResultsViewController *quizResultsVC = [[GPQuizResultsViewController alloc] init];
    
    // seed quiz
    // TODO pass result to next view controller

    [self presentViewController:quizResultsVC animated:YES completion:nil];
}

- (void)dontTrustButtonPressed:(id)sender
{
    // switch view to quiz results
    GPQuizResultsViewController *quizResultsVC = [[GPQuizResultsViewController alloc] init];
    
    // seed quiz
    // TODO pass result to next view controller
    
    [self presentViewController:quizResultsVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
