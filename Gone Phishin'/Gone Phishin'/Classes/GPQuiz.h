//
//  GPQuiz.h
//  Gone Phishing
//
//  Created by wolverine on 12/7/13.
//  Copyright (c) 2013 wolverine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPQuiz : NSObject
{
@private
    NSString *name;
}

- (id)initWithName:(NSString *)quizTakersName;
- (void)seed;
- (NSString *)getName;

@end
