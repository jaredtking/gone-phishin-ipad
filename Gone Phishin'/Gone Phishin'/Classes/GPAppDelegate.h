//
//  GPAppDelegate.h
//  Gone Phishin'
//
//  Created by wolverine on 11/15/13.
//  Copyright (c) 2013 wolverine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "GPRootViewController.h"
#import "GPLandingViewController.h"

#define BACKGROUND_COLOR [UIColor colorWithRed:0/255.0 green:76/255.0 blue:153/255.0 alpha:1.0]
#define BLUETEXT_COLOR [UIColor colorWithRed:204/255.0 green:204/255.0 blue:255/255.0 alpha:1.0]
#define LIGHTBLUEBG_COLOR [UIColor colorWithRed:204/255.0 green:229/255.0 blue:255/255.0 alpha:1.0]

#define MARKER_FONT @"Komika Hand"
#define DEFAULT_FONT @"MarkerFelt-Thin"

#define BLUE_BUTTON_IMAGE [UIImage \
    imageWith2ToneGradient:[UIColor \
        colorWithRed:20/255.0 \
        green:147/255.0 \
        blue:255/255.0 \
        alpha:1.0] \
    tone2:[UIColor \
        colorWithRed:0/255.0 \
        green:127/255.0 \
        blue:225/255.0 \
        alpha:1.0] \
    height:100]

#define GREEN_BUTTON_IMAGE [UIImage \
imageWith2ToneGradient:[UIColor \
colorWithRed:20/255.0 \
green:255/255.0 \
blue:20/255.0 \
alpha:1.0] \
tone2:[UIColor \
colorWithRed:0/255.0 \
green:200/255.0 \
blue:0/255.0 \
alpha:1.0] \
height:100]

#define RED_BUTTON_IMAGE [UIImage \
imageWith2ToneGradient:[UIColor \
colorWithRed:255/255.0 \
green:20/255.0 \
blue:20/255.0 \
alpha:1.0] \
tone2:[UIColor \
colorWithRed:225/255.0 \
green:0/255.0 \
blue:0/255.0 \
alpha:1.0] \
height:100]

@interface GPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end