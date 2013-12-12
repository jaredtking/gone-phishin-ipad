//
//  GPQuizResultsViewController.h
//  Gone Phishing
//
//  Created by wolverine on 12/7/13.
//  Copyright (c) 2013 wolverine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPAppDelegate.h"
#import "GPHighScoresViewController.h"

@interface GPQuizResultsViewController : UIViewController

@property (strong, nonatomic) GPQuiz *quiz;

@property (strong, nonatomic) UILabel *ratingLabel;
@property (strong, nonatomic) UILabel *countLabel;
@property (strong, nonatomic) UILabel *compareLabel;
@property (strong, nonatomic) UIButton *tryAgainButton;
@property (strong, nonatomic) UIButton *viewHighScoresButton;

- (void)tryAgainButtonPressed:(id)sender;
- (void)viewHighScoresButtonPressed:(id)sender;

@end
