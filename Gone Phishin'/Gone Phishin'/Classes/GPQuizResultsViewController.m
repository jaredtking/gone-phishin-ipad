//
//  GPQuizResultsViewController.m
//  Gone Phishing
//
//  Created by wolverine on 12/7/13.
//  Copyright (c) 2013 wolverine. All rights reserved.
//

#import "GPQuizResultsViewController.h"

@implementation GPQuizResultsViewController

@synthesize ratingLabel;
@synthesize countLabel;
@synthesize compareLabel;
@synthesize tryAgainButton;
@synthesize viewHighScoresButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:BACKGROUND_COLOR];
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    [self setNeedsStatusBarAppearanceUpdate];
#else
#endif
	
    //TO-DO: determine user score, and ranking in high score list (-1 if not ranked)
    int numCorrect = 4;
    int totalQuestions = 25;
    int highScorePlace = 4;
    float myScore = ((float)numCorrect)/totalQuestions;
    
    // instantiate UI elements here
    ratingLabel = [[UILabel alloc] init];
    
    if(myScore < 0.2)
        ratingLabel.text = @"Bummer. You are a fish out of water.";
    else if (myScore < 0.4)
        ratingLabel.text = @"Bummer. You are a .";
    else if (myScore < 0.6)
        ratingLabel.text = @"Nice. You are a .";
    else if (myScore < 0.8)
        ratingLabel.text = @"Cool! You are a .";
    else
        ratingLabel.text = @"Radical! You are a fish out of water.";
    ratingLabel.font = [UIFont fontWithName:MARKER_FONT size:20.0];
    ratingLabel.textColor = BLUETEXT_COLOR;
    ratingLabel.backgroundColor = [UIColor clearColor];
    ratingLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:ratingLabel];
    
    countLabel = [[UILabel alloc] init];
    countLabel.text = [NSString stringWithFormat:@"You answered %d/%d questions correctly.", numCorrect, totalQuestions];
    countLabel.font = [UIFont fontWithName:MARKER_FONT size:30.0];
    countLabel.textColor = [UIColor whiteColor];
    countLabel.backgroundColor = [UIColor clearColor];
    countLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:countLabel];
    
    compareLabel = [[UILabel alloc] init];
    if(highScorePlace > 0)
        compareLabel.text = [NSString stringWithFormat:@"That was the %dth best attempt on this iPad to date.", highScorePlace];
    compareLabel.font = [UIFont fontWithName:MARKER_FONT size:20.0];
    compareLabel.textColor = BLUETEXT_COLOR;
    compareLabel.backgroundColor = [UIColor clearColor];
    compareLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:compareLabel];
    
    // instantiate UI elements here
    tryAgainButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [tryAgainButton setTitle:@"Try again" forState:UIControlStateNormal];
    tryAgainButton.titleLabel.font =[UIFont fontWithName:DEFAULT_FONT size:24.0];
    //    [tryAgainButton setFont:[UIFont fontWithName:DEFAULT_FONT size:24.0]];
    [tryAgainButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [tryAgainButton setBackgroundImage:TAKE_QUIZ_BUTTON_IMAGE forState:UIControlStateNormal];
    [tryAgainButton addTarget:self action:@selector(tryAgainButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tryAgainButton];
    
    viewHighScoresButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [viewHighScoresButton setTitle:@"View High Scores" forState:UIControlStateNormal];
    viewHighScoresButton.titleLabel.font =[UIFont fontWithName:DEFAULT_FONT size:24.0];
    //    [viewHighScoresButton setFont:[UIFont fontWithName:DEFAULT_FONT size:24.0]];
    [viewHighScoresButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [viewHighScoresButton setBackgroundImage:GREEN_BUTTON_IMAGE forState:UIControlStateNormal];
    [viewHighScoresButton addTarget:self action:@selector(viewHighScoresButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:viewHighScoresButton];
}

- (UIStatusBarStyle) preferredStatusBarStyle
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    return UIStatusBarStyleLightContent;
#else
    return UIStatusBarStyleDefault;
#endif
}

- (void)viewWillLayoutSubviews
{
    // position UI elements here
    ratingLabel.frame = CGRectMake((1024-500)/2, 250, 500, 44);
    countLabel.frame = CGRectMake((1024-800)/2, 300, 800, 44);
    compareLabel.frame = CGRectMake((1024-800)/2, 400, 800, 44);
    tryAgainButton.frame = CGRectMake(1024/2 - 205, 450, 200, 44);
    viewHighScoresButton.frame = CGRectMake(1024/2 + 5, 450, 200, 44);
}

- (void)tryAgainButtonPressed:(id)sender
{
    // switch view to content item
    GPContentItemViewController *contentItemVC = [[GPContentItemViewController alloc] init];
    
    // seed quiz
    // TODO pass information to view controller
    //contentItemVC.quizTakersName = [nameField text];
    
    [self presentViewController:contentItemVC animated:YES completion:nil];
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
