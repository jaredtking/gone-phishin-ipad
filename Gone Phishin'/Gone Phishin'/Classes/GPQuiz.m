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
    
    // setup questions - just going to hardcode for now
    NSDictionary *question1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"citem1.png",@"image",[NSNumber numberWithBool:NO],@"correct", nil];
    NSDictionary *question2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"citem2.png",@"image",[NSNumber numberWithBool:NO],@"correct", nil];
    NSDictionary *question3 = [[NSDictionary alloc] initWithObjectsAndKeys:@"citem3.png",@"image",[NSNumber numberWithBool:NO],@"correct", nil];
    NSDictionary *question4 = [[NSDictionary alloc] initWithObjectsAndKeys:@"citem4.png",@"image",[NSNumber numberWithBool:YES],@"correct", nil];
    questions = [[NSMutableArray alloc] initWithObjects:question1,question2,question3,question4, nil];
    
    // randomly order questions
    [questions shuffle];
    
    // initialize answers
    answers = [[NSMutableArray alloc] init];
    for (int i = 0; i < [questions count]; i++)
        [answers setObject:[NSNumber numberWithInt:-1] atIndexedSubscript:i];
    
    return self;
}

#pragma mark -
#pragma mark Getters

- (NSString *)getName
{
    return name;
}

- (NSString *)getImageNameForQuestion:(int)n
{
    NSDictionary *question = [questions objectAtIndex:n-1];
    
    return [question objectForKey:@"image"];
}

- (int)numQuestions
{
    return [questions count];
}

- (int)numCorrect
{
    int correct = 0;
    
    int i = 0;
    for (NSDictionary *question in questions) {
        NSNumber *correctAnswer = [question objectForKey:@"correct"];
        NSNumber *userAnswer = [answers objectAtIndex:i];
        if ([correctAnswer intValue] == [userAnswer intValue])
            correct++;

        i++;
    }
    
    return correct;
}

- (float)percentCorrect
{
    return (float)[self numCorrect] / [self numQuestions];
}

#pragma mark -
#pragma mark Setters

- (void)setAnswerForQuestion:(int)n :(BOOL)trusts
{
    [answers setObject:[NSNumber numberWithBool:trusts] atIndexedSubscript:n-1];
}

@end
