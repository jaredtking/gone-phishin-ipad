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
    
    return self;
}

- (void)seed
{
    // generate a random ordering of questions
    // TODO
}

- (NSString *)getName
{
    return name;
}

@end
