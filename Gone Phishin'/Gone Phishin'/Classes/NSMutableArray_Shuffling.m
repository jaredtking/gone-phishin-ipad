//
//  NSMutableArray_Shuffling.m
//  Gone Phishing
//
//  Created by Jared on 12/12/13.
//  Copyright (c) 2013 wolverine. All rights reserved.
//

#import "NSMutableArray_Shuffling.h"

@implementation NSMutableArray (Shuffling)

// found on http://stackoverflow.com/questions/791232/canonical-way-to-randomize-an-nsarray-in-objective-c
- (void)shuffle
{
    static BOOL seeded = NO;
    if(!seeded)
    {
        seeded = YES;
        srandom(time(NULL));
    }
    
    NSUInteger count = [self count];
    for (NSUInteger i = 0; i < count; ++i) {
        // Select a random element between i and end of array to swap with.
        int nElements = count - i;
        int n = (random() % nElements) + i;
        [self exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

@end
