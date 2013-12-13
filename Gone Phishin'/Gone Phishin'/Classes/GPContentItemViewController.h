//
//  GPContentItemViewController.h
//  Gone Phishing
//
//  Created by wolverine on 12/7/13.
//  Copyright (c) 2013 wolverine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPAppDelegate.h"
#import "GPQuizResultsViewController.h"
#import "GPLandingViewController.h"

@interface GPContentItemViewController : UIViewController<UIAlertViewDelegate>

@property int questionNo;
@property (strong, nonatomic) GPQuiz *quiz;

// add UI element properties here
@property (strong, nonatomic) UILabel *trustLabel;
@property (strong, nonatomic) UIButton *trustButton;
@property (strong, nonatomic) UIButton *dontTrustButton;
@property (strong, nonatomic) UIImageView *cItemView;

- (void)cancelButtonPressed:(id)sender;
- (void)trustButtonPressed:(id)sender;
- (void)dontTrustButtonPressed:(id)sender;
- (void)nextQuestion;
- (void)exitQuiz;
- (void)finishQuiz;

@end