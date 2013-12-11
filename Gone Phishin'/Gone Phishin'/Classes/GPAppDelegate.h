//
//  GPAppDelegate.h
//  Gone Phishin'
//
//  Created by wolverine on 11/15/13.
//  Copyright (c) 2013 wolverine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "GPLandingViewController.h"

#define BACKGROUND_COLOR [UIColor colorWithRed:0/255.0 green:76/255.0 blue:153/255.0 alpha:1.0]
#define BLUETEXT_COLOR [UIColor colorWithRed:204/255.0 green:204/255.0 blue:255/255.0 alpha:1.0]

#define DEFAULT_FONT @"MarkerFelt-Thin"

#define TAKE_QUIZ_BUTTON_IMAGE [UIImage \
    imageWith2ToneGradient:[UIColor \
        colorWithRed:0/255.0 \
        green:127/255.0 \
        blue:255/255.0 \
        alpha:1.0] \
    tone2:[UIColor \
        colorWithRed:0/255.0 \
        green:127/255.0 \
        blue:255/255.0 \
        alpha:1.0] \
    height:100]


@interface GPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end