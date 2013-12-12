//
//  GPContentItemParentViewController.h
//  Gone Phishing
//
//  Created by Jared on 12/12/13.
//  Copyright (c) 2013 wolverine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPAppDelegate.h"

@interface GPRootViewController : UINavigationController

@property (strong, nonatomic) UINavigationController *navController;
@property (strong, nonatomic) UIViewController *rootView;

- (id)initWithViewController:(UIViewController *)viewController;

@end
