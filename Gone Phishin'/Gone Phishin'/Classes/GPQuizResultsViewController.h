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

@property (nonatomic, strong) UIButton *viewHighScoresButton;

- (void)viewHighScoresButtonPressed:(id)sender;

@end
