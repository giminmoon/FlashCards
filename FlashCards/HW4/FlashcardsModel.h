//
//  FlashcardsModel.h
//  HW4
//
//  Created by Gimin Moon on 10/21/17.
//  Copyright © 2017 Gimin Moon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Flashcard.h"
@interface FlashcardsModel : NSObject
@property(nonatomic, readonly) unsigned int currentIndex;
@property(nonatomic, strong) NSMutableArray* flashcards;

// Creating the model
+ (instancetype) sharedModel;

// Accessing number of flashcards in model
- (NSUInteger) numberOfFlashcards;
// Accessing a flashcard – sets currentIndex appropriately
- (Flashcard *) randomFlashcard;
- (Flashcard *) flashcardAtIndex: (NSUInteger) index;
- (Flashcard *) nextFlashcard;
- (Flashcard *) prevFlashcard;
// Inserting a flashcard
- (void) insertWithQuestion: (NSString *) question
                     answer: (NSString *) ans
                   favorite: (BOOL) fav;
- (void) insertWithQuestion: (NSString *) question
                     answer: (NSString *) ans
                   favorite: (BOOL) fav
                    atIndex: (NSUInteger) index;
// Removing a flashcard
- (void) removeFlashcard;
- (void) removeFlashcardAtIndex: (NSUInteger) index;
// Favorite/unfavorite the current flashcard
- (void) toggleFavorite;
// Getting the favorite flashcards
- (NSArray *) favoriteFlashcards;



@end
