//
//  GPHighScoresViewController.h
//  Gone Phishing
//
//  Created by wolverine on 12/7/13.
//  Copyright (c) 2013 wolverine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPAppDelegate.h"
#import "GPLandingViewController.h"
#import <CoreData/CoreData.h>

@interface GPHighScoresViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
@private
    NSArray *scores;
}

@property (strong, nonatomic) UILabel *scoresLabel;
@property (strong, nonatomic) UITableView *scoresTableView;
@property (strong, nonatomic) UIButton *goHomeButton;

- (void)goHomeButtonPressed:(id)sender;

@end
