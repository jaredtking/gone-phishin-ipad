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

@interface GPContentItemViewController : UIViewController

// add UI element properties here
@property (strong, nonatomic) UIButton *trustButton;

- (void)trustButtonPressed:(id)sender;

@end