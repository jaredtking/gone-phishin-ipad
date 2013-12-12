//
//  GPContentItemParentViewController.m
//  Gone Phishing
//
//  Created by Jared on 12/12/13.
//  Copyright (c) 2013 wolverine. All rights reserved.
//

#import "GPRootViewController.h"

@implementation GPRootViewController

@synthesize navController;
@synthesize rootView;

- (id)initWithViewController:(UIViewController *)viewController
{
    self = [super init];
    
    rootView = viewController;
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // init nav controller
    navController = [[UINavigationController alloc] initWithRootViewController:rootView];
    
    self.view.backgroundColor = BACKGROUND_COLOR;
        
    //[[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
    
    // load view controlled by nav controller into the main view
    [self.view addSubview:navController.view];
}

- (void)viewDidUnload
{
    navController = nil;
    rootView = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
