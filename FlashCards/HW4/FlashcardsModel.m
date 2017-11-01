//
//  FlashcardsModel.m
//  HW4
//
//  Created by Gimin Moon on 10/21/17.
//  Copyright © 2017 Gimin Moon. All rights reserved.
//

#import "FlashcardsModel.h"
#import "Flashcard.h"
@implementation FlashcardsModel

+ (instancetype) sharedModel{
    static FlashcardsModel *flashcardmodel = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        flashcardmodel = [[FlashcardsModel alloc] init];
    });
    return flashcardmodel;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _flashcards = [[NSMutableArray alloc] init];
        [ _flashcards addObject:[[Flashcard alloc] initWithQuestion:@"What % of the grade is the 2nd midterm worth?" answer:@"15%"]];
        [ _flashcards addObject:[[Flashcard alloc] initWithQuestion:@"What is our professors name ?" answer:@"Bennet Lee"]];
        [ _flashcards addObject:[[Flashcard alloc] initWithQuestion:@"What are the colors for USC" answer:@"Cardinal and Gold"]];
        [ _flashcards addObject:[[Flashcard alloc] initWithQuestion:@"Name on of our TA?" answer:@"Jason Zheng aka JZ"]];
        [ _flashcards addObject:[[Flashcard alloc] initWithQuestion:@"Name the date of Declaration of Indenpednece" answer:@" 7/4/1776"]];
        _currentIndex = 0;
    }
    return self;
}

-(NSUInteger) numberOfFlashcards{
    return _flashcards.count;
}

-(Flashcard*) randomFlashcard{
    NSUInteger index = arc4random_uniform((int32_t) _flashcards.count);
    _currentIndex = (unsigned int) index;
    return _flashcards[index];
}
                                          
-(Flashcard*) flashcardAtIndex:(NSUInteger)index {
    _currentIndex = index;
    return _flashcards[index];
}

-(Flashcard*) nextFlashcard{
    if(_currentIndex+1 == _flashcards.count)
    {
        _currentIndex = 0;
        return _flashcards[0];
    }
    else{
        _currentIndex += 1;
        return _flashcards[_currentIndex + 1];
    }
}

-(Flashcard*) prevFlashcard{
    if(_currentIndex == 0)
    {
        _currentIndex = (unsigned int) _flashcards.count -1;
        return _flashcards[_flashcards.count -1];
    }
    else{
        _currentIndex -= 1;
        return _flashcards[_currentIndex - 1];
    }
}

-(void) insertWithQuestion:(NSString *)question answer:(NSString *)ans favorite:(BOOL)fav{
    [self.flashcards addObject:[[Flashcard alloc] initWithQuestion:question answer:ans isFavorite:fav]];
}

-(void) insertWithQuestion:(NSString *)question answer:(NSString *)ans favorite:(BOOL)fav atIndex:(NSUInteger)index{
    
    if(index <= _flashcards.count)
    {
        [self.flashcards insertObject:[[Flashcard alloc] initWithQuestion:question answer:ans isFavorite:fav] atIndex:index];
    }
    else{
        // error?
    }
}

- (void) removeFlashcard{
    if(_currentIndex == _flashcards.count -1)
    {
        _currentIndex -= 1;
    }
    [self.flashcards removeLastObject];
}

-(void) removeFlashcardAtIndex:(NSUInteger)index{
    if(index <= _flashcards.count)
    {
        [self.flashcards removeObjectAtIndex:index];
    }
}
- (void) toggleFavorite{
    Flashcard* fc = self.flashcards[_currentIndex];
    if(fc.isFavorite)
    {
        fc.isFavorite = false;
    }
    else{
        fc.isFavorite = true;
    }
}
- (NSArray*) favoriteFlashcards{
    NSMutableArray* array;
    for(int i = 0; i < _flashcards.count; i++)
    {
        if([(Flashcard*)[_flashcards objectAtIndex:i] isFavorite]){
            [array addObject: _flashcards[i]];
        }
    }
    return array;
}


@end
