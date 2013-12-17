//
//  GPQuiz.h
//  Gone Phishing
//
//  Created by wolverine on 12/7/13.
//  Copyright (c) 2013 wolverine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableArray_Shuffling.h"

@interface GPQuiz : NSObject
{
@private
    NSString *name;
    NSMutableArray *questions;
    NSMutableArray *answers;
}

- (id)initWithName:(NSString *)quizTakersName;

- (NSString *)getName;
- (NSString *)getImageNameForQuestion:(int)n;
- (int)numQuestions;
- (int)numCorrect;
- (double)percentCorrect;

- (void)setAnswerForQuestion:(int)n :(BOOL)trusts;

@end
