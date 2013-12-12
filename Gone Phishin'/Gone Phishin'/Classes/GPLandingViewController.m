//
//  GPMainViewController.m
//  Gone Phishin'
//
//  Created by wolverine on 11/15/13.
//  Copyright (c) 2013 wolverine. All rights reserved.
//

#import "GPLandingViewController.h"

@implementation GPLandingViewController

@synthesize scrollView;
@synthesize titleLabel;
@synthesize imageView;
@synthesize bylineLabel;
@synthesize nameFieldLabel;
@synthesize instructionLabel;
@synthesize quizButton;
@synthesize nameField;
@synthesize scoreButton;
@synthesize audioButton;
@synthesize instructAudio;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:BACKGROUND_COLOR];
    
    // hide the keyboard when tapped outside
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(resignKeyboard:)];
    [self.view addGestureRecognizer:tap];
    
    // keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    // scroll view
    scrollView = [[UIScrollView alloc] init];
    scrollView.scrollEnabled = NO;
    scrollView.bounces = NO;
    [self.view addSubview:scrollView];
    
    // logo
    UIImage *image = [UIImage imageNamed:@"landing-logo.png"];
    imageView = [[UIImageView alloc] initWithImage:image];
    imageView.contentMode = UIViewContentModeCenter;
    [scrollView addSubview:imageView];
    
    // title label
    titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"Gone Phishing";
    titleLabel.font = [UIFont fontWithName:MARKER_FONT size:60.0];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    [scrollView addSubview:titleLabel];
    
    // byline label
    bylineLabel = [[UILabel alloc] init];
    bylineLabel.text = @"\"A fine kettle of phish since 2013\"";
    bylineLabel.font = [UIFont fontWithName:MARKER_FONT size:25.0];
    bylineLabel.textColor = [UIColor whiteColor];
    bylineLabel.backgroundColor = [UIColor clearColor];
    [scrollView addSubview:bylineLabel];
    
    // instruction label
    instructionLabel = [[UILabel alloc] init];
    instructionLabel.text = @"Test your skills at detecting suspicious content by taking our quiz.";
    instructionLabel.font = [UIFont fontWithName:MARKER_FONT size:20.0];
    instructionLabel.lineBreakMode = NSLineBreakByWordWrapping;
    instructionLabel.numberOfLines = 0;
    instructionLabel.textColor = BLUETEXT_COLOR;
    instructionLabel.backgroundColor = [UIColor clearColor];
    [scrollView addSubview:instructionLabel];
    
    // name field label
    nameFieldLabel = [[UILabel alloc] init];
    nameFieldLabel.text = @"What is your name?";
    nameFieldLabel.font = [UIFont fontWithName:MARKER_FONT size:25.0];
    nameFieldLabel.textColor = BLUETEXT_COLOR;
    nameFieldLabel.backgroundColor = [UIColor clearColor];
    [scrollView addSubview:nameFieldLabel];
    
    // name field
    nameField = [[UITextField alloc] init];
    nameField.borderStyle = UITextBorderStyleRoundedRect;
    nameField.font = [UIFont fontWithName:DEFAULT_FONT size:40.0];
    nameField.autocorrectionType = UITextAutocorrectionTypeNo;
    nameField.backgroundColor = LIGHTBLUEBG_COLOR;
    nameField.returnKeyType = UIReturnKeyGo;
    // hack to add padding
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    nameField.leftView = paddingView;
    nameField.leftViewMode = UITextFieldViewModeAlways;
    [scrollView addSubview:nameField];
    
    // take quiz button
    quizButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [quizButton setTitle:@"Take the quiz!" forState:UIControlStateNormal];
    quizButton.titleLabel.font =[UIFont fontWithName:DEFAULT_FONT size:24.0];
    [quizButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [quizButton setBackgroundImage:BLUE_BUTTON_IMAGE forState:UIControlStateNormal];
    //[quizButton.layer setBorderColor:[[UIColor blackColor] CGColor]];
    //[quizButton.layer setBorderWidth:1.0];
    //[quizButton.layer setCornerRadius:10];
    [quizButton addTarget:self action:@selector(takeQuizButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:quizButton];
    
    // high scores button
    scoreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [scoreButton setTitle:@"view the high scores" forState:UIControlStateNormal];
    scoreButton.titleLabel.font = [UIFont fontWithName:DEFAULT_FONT size:20.0];
    [scoreButton setTitleColor:BLUETEXT_COLOR forState:UIControlStateNormal];
    //[scoreButton setBackgroundImage:TAKE_QUIZ_BUTTON_IMAGE forState:UIControlStateNormal];
    [scoreButton addTarget:self action:@selector(showScoresButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:scoreButton];
    
    // play audio button
    audioButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [audioButton setTitle:@"audio instructions" forState:UIControlStateNormal];
    audioButton.titleLabel.font = [UIFont fontWithName:DEFAULT_FONT size:20.0];
    [audioButton setTitleColor:BLUETEXT_COLOR forState:UIControlStateNormal];
    [audioButton addTarget:self action:@selector(playAudioButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:audioButton];
    
    // load instructions audio
    NSURL* audioUrl  = [[NSBundle mainBundle] URLForResource:@"instructions" withExtension:@"wav"];
    NSAssert(audioUrl,@"URL is valid.");
    NSError* error = nil;
    instructAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:audioUrl error:&error];
    if(!(instructAudio))
    {
        NSLog(@"Error creating player: %@",error);
    }
    [instructAudio setDelegate:self];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    titleLabel = nil;
    bylineLabel = nil;
    instructionLabel = nil;
    nameFieldLabel = nil;
    quizButton = nil;
    imageView = nil;
    scoreButton = nil;
    audioButton = nil;
    nameField = nil;
    instructAudio = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated
{
    // hide navigation bar
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
#else
#endif
}

- (void)viewWillLayoutSubviews
{
    scrollView.frame =       self.view.frame;
    scrollView.contentSize = self.view.frame.size;
    
    titleLabel.frame =       CGRectMake(450, 180, 500, 80);
    bylineLabel.frame =      CGRectMake(450, 260, 500, 36);
    instructionLabel.frame = CGRectMake(450, 300, 500, 100);
    nameFieldLabel.frame =   CGRectMake(450, 370, 500, 100);
    [instructionLabel sizeToFit];
    
    nameField.frame =        CGRectMake(450, 450, 500, 50);
    
    quizButton.frame =       CGRectMake(450, 520, 200, 50);
    scoreButton.frame =      CGRectMake(450, 600, 200, 50);
    audioButton.frame =      CGRectMake(804, 698, 200, 50);
    
    CGRect frame = imageView.frame;
    frame.size.width = (1024 / 2) - (30 * 2);
    frame.size.height = 768;
    imageView.frame = frame;
}

- (void)resignKeyboard:(id)sender
{
    [nameField resignFirstResponder];
}

#pragma mark -
#pragma mark Button Presses

- (void)takeQuizButtonPressed:(id)sender
{
    // validate the name
    NSString *name = [nameField text];
    if ([name length] == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops" message:@"You need to input a name first" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    // create a quiz
    GPQuiz *quiz = [[GPQuiz alloc] initWithName:name];
    
    // create first content item view
    GPContentItemViewController *contentItemVC = [[GPContentItemViewController alloc] init];
    
    // pass quiz onto first content item view controller
    contentItemVC.quiz = quiz;
    
    // finally present the navigation controller
    [self.navigationController pushViewController:contentItemVC animated:YES];
}

- (void)showScoresButtonPressed:(id)sender
{
    // switch view to high score table
    GPHighScoresViewController *highScoresVC = [[GPHighScoresViewController alloc] init];
    
    // push new view onto navigation stack
    [self.navigationController pushViewController:highScoresVC animated:YES];
}

- (void)playAudioButtonPressed:(id)sender
{
    if(instructAudio.playing == YES)
    {
        [instructAudio stop];
        instructAudio.currentTime = 0;
        [audioButton setTitle:@"audio instructions" forState:UIControlStateNormal];
    }
    else
    {
        [instructAudio play];
        [audioButton setTitle:@"stop" forState:UIControlStateNormal];
    }
}

#pragma mark -
#pragma mark AVAudioPlayer Delegate

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [audioButton setTitle:@"audio instructions" forState:UIControlStateNormal];
}

#pragma mark -
#pragma mark UITextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self takeQuizButtonPressed:nil];
    return NO;
}

#pragma mark -
#pragma mark Notifications

- (void)keyboardWasShown:(NSNotification *)notification
{
    keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    // scroll the view by adding the keyboard width + some padding
    // using width because we are in landscape mode
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.width + 90, 0.0);
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    scrollView.contentInset = UIEdgeInsetsZero;
    scrollView.scrollIndicatorInsets = UIEdgeInsetsZero;
}

@end
