//
//  GPMainViewController.h
//  Gone Phishin'
//
//  Created by wolverine on 11/15/13.
//  Copyright (c) 2013 wolverine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Availability.h>
#import "GPAppDelegate.h"
#import "UIImage+JTKGradient.h"
#import "GPQuiz.h"
#import "GPContentItemViewController.h"
#import "GPRootViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface GPLandingViewController : UIViewController<AVAudioPlayerDelegate,UITextFieldDelegate>
{
@private
    CGSize keyboardSize;
    UITextField *activeField;
}

- (void)resignKeyboard:(id)sender;
- (void)takeQuizButtonPressed:(id)sender;
- (void)showScoresButtonPressed:(id) sender;
- (void)playAudioButtonPressed:(id) sender;

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *bylineLabel;
@property (strong, nonatomic) UILabel *instructionLabel;
@property (strong, nonatomic) UILabel *nameFieldLabel;
@property (strong, nonatomic) UIButton *quizButton;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIButton *scoreButton;
@property (strong, nonatomic) UIButton *audioButton;

@property (strong, nonatomic) UITextField *nameField;

@property (strong, nonatomic) AVAudioPlayer *instructAudio;

@end
