//
//  Flashcard.h
//  HW4
//
//  Created by Gimin Moon on 10/21/17.
//  Copyright © 2017 Gimin Moon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flashcard : NSObject
@property(nonatomic, readonly) NSString* question;
@property(nonatomic, readonly) NSString* answer;
@property(nonatomic, assign) BOOL isFavorite;

- (instancetype) initWithQuestion: (NSString *) question
                           answer: (NSString *) ans;

- (instancetype) initWithQuestion: (NSString *) question
                           answer: (NSString *) ans
                       isFavorite: (BOOL) isFav;
@end
