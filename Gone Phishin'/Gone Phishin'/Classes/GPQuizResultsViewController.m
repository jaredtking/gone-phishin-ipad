//
//  GPQuizResultsViewController.m
//  Gone Phishing
//
//  Created by wolverine on 12/7/13.
//  Copyright (c) 2013 wolverine. All rights reserved.
//

#import "GPQuizResultsViewController.h"

@implementation GPQuizResultsViewController

@synthesize viewHighScoresButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:BACKGROUND_COLOR];
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    [self setNeedsStatusBarAppearanceUpdate];
#else
#endif
	
    // instantiate UI elements here
    viewHighScoresButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [viewHighScoresButton setTitle:@"View High Scores" forState:UIControlStateNormal];
    viewHighScoresButton.titleLabel.font =[UIFont fontWithName:DEFAULT_FONT size:24.0];
    //    [viewHighScoresButton setFont:[UIFont fontWithName:DEFAULT_FONT size:24.0]];
    [viewHighScoresButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [viewHighScoresButton setBackgroundImage:TAKE_QUIZ_BUTTON_IMAGE forState:UIControlStateNormal];
    [viewHighScoresButton addTarget:self action:@selector(viewHighScoresButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:viewHighScoresButton];
}

- (void)viewWillLayoutSubviews
{
    // position UI elements here
    viewHighScoresButton.frame = CGRectMake(100, 100, 200, 44);
}

- (void)viewHighScoresButtonPressed:(id)sender
{
    // switch view to high scores
    GPHighScoresViewController *highScoresVC = [[GPHighScoresViewController alloc] init];
        
    [self presentViewController:highScoresVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
