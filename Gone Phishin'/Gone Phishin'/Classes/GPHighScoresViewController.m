//
//  GPHighScoresViewController.m
//  Gone Phishing
//
//  Created by wolverine on 12/7/13.
//  Copyright (c) 2013 wolverine. All rights reserved.
//

#import "GPHighScoresViewController.h"

@implementation GPHighScoresViewController

@synthesize scoresLabel;
@synthesize scoresTableView;
@synthesize goHomeButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:BACKGROUND_COLOR];
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    [self setNeedsStatusBarAppearanceUpdate];
#else
#endif
	
    // instantiate UI elements here
    scoresLabel = [[UILabel alloc] init];
    scoresLabel.text = @"High Scores";
    scoresLabel.font = [UIFont fontWithName:MARKER_FONT size:30.0];
    scoresLabel.textColor = [UIColor whiteColor];
    scoresLabel.backgroundColor = [UIColor clearColor];
    scoresLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:scoresLabel];
    
    //TO-DO: set up the scores table, with the data
    scoresTableView = [[UITableView alloc] init];
    
    goHomeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [goHomeButton setTitle:@"Return to Home" forState:UIControlStateNormal];
    goHomeButton.titleLabel.font =[UIFont fontWithName:DEFAULT_FONT size:24.0];
    //    [goHomeButton setFont:[UIFont fontWithName:DEFAULT_FONT size:24.0]];
    [goHomeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [goHomeButton setBackgroundImage:TAKE_QUIZ_BUTTON_IMAGE forState:UIControlStateNormal];
    [goHomeButton addTarget:self action:@selector(goHomeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goHomeButton];
}

- (void)viewWillLayoutSubviews
{
    // position UI elements here
    scoresLabel.frame = CGRectMake((1024-300)/2, 150, 300, 44);
    scoresTableView.frame = CGRectMake((1024-500)/2, 200, 500, 300);
    goHomeButton.frame = CGRectMake((1024-500)/2, 600, 500, 44);
}

- (void)goHomeButtonPressed:(id)sender
{
    // switch view to high scores
    GPLandingViewController *landingVC = [[GPLandingViewController alloc] init];
    
    [self presentViewController:landingVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
