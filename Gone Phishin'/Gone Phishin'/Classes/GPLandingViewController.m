//
//  GPMainViewController.m
//  Gone Phishin'
//
//  Created by wolverine on 11/15/13.
//  Copyright (c) 2013 wolverine. All rights reserved.
//

#import "GPLandingViewController.h"

@implementation GPLandingViewController

@synthesize titleLabel;
@synthesize imageView;

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
    imageView = [[UIImageView alloc] initWithImage:image];
    imageView.contentMode = UIViewContentModeCenter;
    [self.view addSubview:imageView];
    
    // title label
    titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"Gone Phishing";
    titleLabel.font = [UIFont fontWithName:@"MarkerFelt-Thin" size:50.0];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:titleLabel];
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
    titleLabel.frame = CGRectMake(500, 200, 320, 36);
    
    CGRect frame = imageView.frame;
    frame.size.width = (1024 / 2) - (30 * 2);
    frame.size.height = 768;
    imageView.frame = frame;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
