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
@synthesize quiz;

- (NSString *)ordinalSuffix:(int)N
{
    if (N >= 11 && N <= 20)
        return @"th";
    else if (N % 10 == 1)
        return @"st";
    else if (N % 10 == 2)
        return @"nd";
    else if (N % 10 == 3)
        return @"rd";
    else
        return @"th";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:BACKGROUND_COLOR];
    
    // grab core data context
    NSManagedObjectContext *context = [(GPAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    
    // calculate quiz results
    int numCorrect = [quiz numCorrect];
    int totalQuestions = [quiz numQuestions];
    double myScore = [quiz percentCorrect];
    
    // store score
    NSManagedObject *newScore = [NSEntityDescription insertNewObjectForEntityForName:@"Scores" inManagedObjectContext:context];
    [newScore setValue:[quiz getName] forKey:@"name"];
    [newScore setValue:[NSNumber numberWithDouble:[quiz percentCorrect]] forKey:@"score"];
    NSError *error;
    [context save:&error];
    
    // determine high score place
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Scores"
                inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(score > %f)", myScore];
    [request setPredicate:pred];
    NSArray *objects = [context executeFetchRequest:request error:&error];
    int highScorePlace = [objects count] + 1;
    
    // instantiate UI elements here
    ratingLabel = [[UILabel alloc] init];
    
    if(myScore < 0.2)
        ratingLabel.text = @"Ouch. You have been phished.";
    else if (myScore < 0.4)
        ratingLabel.text = @"Bummer. You are a fish out of water.";
    else if (myScore < 0.6)
        ratingLabel.text = @"Nice. You sometimes escaped the fishermen.";
    else if (myScore < 0.8)
        ratingLabel.text = @"Good job! You are almost safe.";
    else
        ratingLabel.text = @"Radical! You could be a fisherman yourself.";
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
        compareLabel.text = [NSString stringWithFormat:@"That was the %d%@ best attempt on this iPad to date.", highScorePlace, [self ordinalSuffix:highScorePlace]];
    compareLabel.font = [UIFont fontWithName:MARKER_FONT size:20.0];
    compareLabel.textColor = BLUETEXT_COLOR;
    compareLabel.backgroundColor = [UIColor clearColor];
    compareLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:compareLabel];
    
    // instantiate UI elements here
    tryAgainButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [tryAgainButton setTitle:@"Try again" forState:UIControlStateNormal];
    tryAgainButton.titleLabel.font =[UIFont fontWithName:DEFAULT_FONT size:24.0];
    [tryAgainButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [tryAgainButton setBackgroundImage:BLUE_BUTTON_IMAGE forState:UIControlStateNormal];
    [tryAgainButton addTarget:self action:@selector(tryAgainButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tryAgainButton];
    
    viewHighScoresButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [viewHighScoresButton setTitle:@"View High Scores" forState:UIControlStateNormal];
    viewHighScoresButton.titleLabel.font =[UIFont fontWithName:DEFAULT_FONT size:24.0];
    [viewHighScoresButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [viewHighScoresButton setBackgroundImage:GREEN_BUTTON_IMAGE forState:UIControlStateNormal];
    [viewHighScoresButton addTarget:self action:@selector(viewHighScoresButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:viewHighScoresButton];
}

- (void)viewDidUnload
{
    quiz = nil;
    ratingLabel = nil;
    countLabel = nil;
    compareLabel = nil;
    tryAgainButton = nil;
    viewHighScoresButton = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    // hide navigation bar
    [self.navigationController setNavigationBarHidden:YES animated:YES];

#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
#else
#endif
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
    // create a quiz
    GPQuiz *newQuiz = [[GPQuiz alloc] initWithName:[quiz getName]];
    
    // create first content item view
    GPContentItemViewController *firstQuestionVC = [[GPContentItemViewController alloc] init];
    
    // pass quiz onto first content item view controller
    firstQuestionVC.quiz = newQuiz;
    firstQuestionVC.questionNo = 1;
    
    // finally present the navigation controller
    [self.navigationController pushViewController:firstQuestionVC animated:YES];
}

- (void)viewHighScoresButtonPressed:(id)sender
{
    // switch view to high scores
    GPHighScoresViewController *highScoresVC = [[GPHighScoresViewController alloc] init];

    // push new view onto navigation stack
    [self.navigationController pushViewController:highScoresVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
