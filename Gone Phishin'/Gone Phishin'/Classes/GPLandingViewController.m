//
//  GPMainViewController.m
//  Gone Phishin'
//
//  Created by wolverine on 11/15/13.
//  Copyright (c) 2013 wolverine. All rights reserved.
//

#import "GPLandingViewController.h"

@implementation GPLandingViewController

@synthesize titleLabel;
@synthesize imageView;
@synthesize bylineLabel;
@synthesize nameFieldLabel;
@synthesize instructionLabel;
@synthesize quizButton;
@synthesize nameField;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:BACKGROUND_COLOR];
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    [self setNeedsStatusBarAppearanceUpdate];
#else
#endif
    
    // hide the keyboard when tapped outside
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(resignKeyboard:)];
    [self.view addGestureRecognizer:tap];
    
    // keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    // logo
    UIImage *image = [UIImage imageNamed:@"landing-logo.png"];
    imageView = [[UIImageView alloc] initWithImage:image];
    imageView.contentMode = UIViewContentModeCenter;
    [self.view addSubview:imageView];
    
    // title label
    titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"Gone Phishing";
    titleLabel.font = [UIFont fontWithName:DEFAULT_FONT size:50.0];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:titleLabel];
    
    // title label
    bylineLabel = [[UILabel alloc] init];
    bylineLabel.text = @"\"A fine kettle of phish since 2013\"";
    bylineLabel.font = [UIFont fontWithName:DEFAULT_FONT size:30.0];
    bylineLabel.textColor = [UIColor whiteColor];
    bylineLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:bylineLabel];
    
    // instruction label
    instructionLabel = [[UILabel alloc] init];
    instructionLabel.text = @"Test your skills at detecting suspicious content by taking our quiz.";
    instructionLabel.font = [UIFont fontWithName:DEFAULT_FONT size:24.0];
    instructionLabel.lineBreakMode = NSLineBreakByWordWrapping;
    instructionLabel.numberOfLines = 0;
    instructionLabel.textColor = [UIColor whiteColor];
    instructionLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:instructionLabel];
    
    // name field label
    nameFieldLabel = [[UILabel alloc] init];
    nameFieldLabel.text = @"What is your name?";
    nameFieldLabel.font = [UIFont fontWithName:DEFAULT_FONT size:20.0];
    nameFieldLabel.textColor = [UIColor whiteColor];
    nameFieldLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:nameFieldLabel];
    
    // name field
    nameField = [[UITextField alloc] init];
    nameField.borderStyle = UITextBorderStyleRoundedRect;
    nameField.font = [UIFont fontWithName:DEFAULT_FONT size:48.0];
    nameField.autocorrectionType = UITextAutocorrectionTypeNo;
    nameField.backgroundColor = [UIColor colorWithRed:204/255.0 green:229/255.0 blue:255/255.0 alpha:1.0];
    [self.view addSubview:nameField];
    
    // take quiz button
    quizButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [quizButton setTitle:@"Take the quiz!" forState:UIControlStateNormal];
    quizButton.titleLabel.font =[UIFont fontWithName:DEFAULT_FONT size:24.0];
    //    [quizButton setFont:[UIFont fontWithName:DEFAULT_FONT size:24.0]];
    [quizButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [quizButton setBackgroundImage:TAKE_QUIZ_BUTTON_IMAGE forState:UIControlStateNormal];
    //[quizButton.layer setBorderColor:[[UIColor blackColor] CGColor]];
    //[quizButton.layer setBorderWidth:1.0];
    //[quizButton.layer setCornerRadius:10];
    [quizButton addTarget:self action:@selector(takeQuizButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:quizButton];
    
    // 
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
    titleLabel.frame =       CGRectMake(500, 200, 500, 80);
    bylineLabel.frame =      CGRectMake(500, 260, 500, 36);
    instructionLabel.frame = CGRectMake(500, 300, 500, 100);
    nameFieldLabel.frame =   CGRectMake(500, 400, 500, 100);
    [instructionLabel sizeToFit];
    
    nameField.frame =        CGRectMake(500, 500, 500, 50);
    
    quizButton.frame =       CGRectMake(500, 600, 200, 50);
    
    CGRect frame = imageView.frame;
    frame.size.width = (1024 / 2) - (30 * 2);
    frame.size.height = 768;
    imageView.frame = frame;
}

- (void)resignKeyboard:(id)sender
{
    [nameField resignFirstResponder];
}

- (void)takeQuizButtonPressed:(id)sender
{
    // switch view to content item
    GPContentItemViewController *contentItemVC = [[GPContentItemViewController alloc] init];
    
    // seed quiz
    // TODO pass information to view controller
    //contentItemVC.quizTakersName = [nameField text];
    
    [self presentViewController:contentItemVC animated:YES completion:nil];
}

- (void)keyboardWasShown:(NSNotification *)notification
{
    // get the size of the keyboard
    keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    // adjust the bottom content inset of scroll view by the keyboard height.
    //UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
