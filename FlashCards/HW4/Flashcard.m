//
//  Flashcard.m
//  HW4
//
//  Created by Gimin Moon on 10/21/17.
//  Copyright © 2017 Gimin Moon. All rights reserved.
//

#import "Flashcard.h"

@implementation Flashcard


// implementing methods
- (instancetype) initWithQuestion:(NSString *)question answer:(NSString *)ans{
    self = [super init];
    if(self) {
        _question = question;
        _answer = ans;
    }
    return(self);
}

- (instancetype) initWithQuestion:(NSString *)question answer:(NSString *)ans isFavorite:(BOOL)isFav{
    self = [super init];
    if(self) {
        _question = question;
        _answer = ans;
        _isFavorite = isFav;
    }
    return(self);
}


@end
