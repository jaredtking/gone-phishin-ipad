//
//  GPContentItemViewController.m
//  Gone Phishing
//
//  Created by wolverine on 12/7/13.
//  Copyright (c) 2013 wolverine. All rights reserved.
//

#import "GPContentItemViewController.h"

@implementation GPContentItemViewController

@synthesize trustButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:BACKGROUND_COLOR];
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    [self setNeedsStatusBarAppearanceUpdate];
#else
#endif
	
    // instantiate UI elements here
    trustButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [trustButton setTitle:@"Trust" forState:UIControlStateNormal];
    trustButton.titleLabel.font =[UIFont fontWithName:DEFAULT_FONT size:24.0];
//    [trustButton setFont:[UIFont fontWithName:DEFAULT_FONT size:24.0]];
    [trustButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [trustButton setBackgroundImage:TAKE_QUIZ_BUTTON_IMAGE forState:UIControlStateNormal];
    [trustButton addTarget:self action:@selector(trustButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:trustButton];
}

- (void)viewWillLayoutSubviews
{
    // position UI elements here
    trustButton.frame = CGRectMake(100, 100, 200, 44);
}

- (void)trustButtonPressed:(id)sender
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
