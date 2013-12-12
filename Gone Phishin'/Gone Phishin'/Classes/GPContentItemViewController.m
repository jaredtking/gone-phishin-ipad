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
@synthesize quiz;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:BACKGROUND_COLOR];
    
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
    [trustButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [trustButton setBackgroundImage:GREEN_BUTTON_IMAGE forState:UIControlStateNormal];
    [trustButton addTarget:self action:@selector(trustButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:trustButton];

    dontTrustButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [dontTrustButton setTitle:@"Don't trust" forState:UIControlStateNormal];
    dontTrustButton.titleLabel.font =[UIFont fontWithName:DEFAULT_FONT size:24.0];
    [dontTrustButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [dontTrustButton setBackgroundImage:RED_BUTTON_IMAGE forState:UIControlStateNormal];
    [dontTrustButton addTarget:self action:@selector(dontTrustButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dontTrustButton];
    
    // logo
    UIImage *content = [UIImage imageNamed:@"cItem1.png"];
    cItemView = [[UIImageView alloc] initWithImage:content];
    cItemView.contentMode = UIViewContentModeCenter;
    [self.view addSubview:cItemView];
    
    // remove back button for first question
    [self.navigationItem setHidesBackButton:[quiz getQuestionNo] == 1];

    // end quiz button
    UIBarButtonItem *endQuizItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonPressed:)];
    
    NSArray *actionButtonItems = @[endQuizItem];
    self.navigationItem.rightBarButtonItems = actionButtonItems;
}

- (void)viewDidUnload
{
    quiz = nil;
    trustLabel = nil;
    trustButton = nil;
    dontTrustButton = nil;
    cItemView = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    // show navigation bar
    [self.navigationController setNavigationBarHidden:NO animated:YES];
        
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
#else
#endif
}

- (void)viewWillLayoutSubviews
{
    // position UI elements here
    trustLabel.frame = CGRectMake((1024-400)/2, 100, 400, 44);
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

#pragma mark -
#pragma mark Button Presses

- (void)cancelButtonPressed:(id)sender
{
    // ask user if they really want to quit
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Cancel quiz" message:@"Are you sure you want to quit?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    
    [alert show];
}

- (void)trustButtonPressed:(id)sender
{
    [self finishQuiz];
}

- (void)dontTrustButtonPressed:(id)sender
{
    [self finishQuiz];
}

#pragma mark -
#pragma mark Quiz Transitions

- (void)nextQuestion
{
    
}

- (void)finishQuiz
{
    // move to quiz results
    GPQuizResultsViewController *quizResultsVC = [[GPQuizResultsViewController alloc] init];
    
    // pass quiz to quiz results
    quizResultsVC.quiz = quiz;
    
    // push new view onto navigation stack
    [self.navigationController pushViewController:quizResultsVC animated:YES];
}


- (void)exitQuiz
{
    // go back to landing
    GPLandingViewController *landingVC = [[GPLandingViewController alloc] init];
    
    // push new view onto navigation stack
    [self.navigationController pushViewController:landingVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Alert View Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
        [self exitQuiz];
}

@end
