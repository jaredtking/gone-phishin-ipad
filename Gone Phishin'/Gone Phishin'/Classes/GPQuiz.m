//
//  GPQuiz.m
//  Gone Phishing
//
//  Created by wolverine on 12/7/13.
//  Copyright (c) 2013 wolverine. All rights reserved.
//

#import "GPQuiz.h"

@implementation GPQuiz

- (id)initWithName:(NSString *)quizTakersName
{
    self = [super init];
    
    name = quizTakersName;
    
    // seed quiz
    [self seed];
    
    questionNo = 1;
    
    return self;
}

#pragma mark -
#pragma mark Getters

- (NSString *)getName
{
    return name;
}

- (int)numQuestions
{
    // TOOD
    return 1;
}

- (int)getQuestionNo
{
    return questionNo;
}

- (BOOL)atEnd
{
    return questionNo >= [self numQuestions];
}

- (int)numCorrect
{
    // TODO
    return 0;
}

- (float)percentCorrect
{
    return (float)[self numCorrect] / [self numQuestions];
}

#pragma mark -
#pragma mark Setters

- (void)seed
{
    // generate a random ordering of questions
    // TODO
}

- (void)setQuestionNo:(int)n
{
    questionNo = n;
}

@end
