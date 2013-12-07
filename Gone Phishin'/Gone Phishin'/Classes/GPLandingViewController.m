//
//  GPMainViewController.m
//  Gone Phishin'
//
//  Created by wolverine on 11/15/13.
//  Copyright (c) 2013 wolverine. All rights reserved.
//

#import "GPLandingViewController.h"

@implementation GPLandingViewController

@synthesize helloLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:BACKGROUND_COLOR];
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    [self setNeedsStatusBarAppearanceUpdate];
#else
#endif
    
    // logo
    UIImage *image = [UIImage imageNamed:@"landing-logo.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.contentMode = UIViewContentModeCenter;
    CGRect frame = imageView.frame;
    frame.size.width = (1024 / 2) - (30 * 2);
    frame.size.height = 768;
    imageView.frame = frame;
    [self.view addSubview:imageView];
    
    helloLabel = [[UILabel alloc] init];
    helloLabel.text = @"Gone Phishing";
    helloLabel.frame = CGRectMake(764, 519, 300, 36);
    helloLabel.font = [UIFont fontWithName:@"MarkerFelt-Thin" size:29.0];
    helloLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:helloLabel];
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
    helloLabel.frame = CGRectMake(100, 10, 320, 26);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
