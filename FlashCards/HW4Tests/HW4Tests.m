//
//  HW4Tests.m
//  HW4Tests
//
//  Created by Gimin Moon on 10/21/17.
//  Copyright © 2017 Gimin Moon. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FlashcardsModel.h"
#import "Flashcard.h"

@interface HW4Tests : XCTestCase
@property (nonatomic, weak) FlashcardsModel *mModel;
@end

@implementation HW4Tests

- (void)setUp {
    [super setUp];
    self.mModel = [FlashcardsModel sharedModel];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    int num = 5; //model should start with 5 cards
    XCTAssertEqual(num, [_mModel numberOfFlashcards]);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

-(void) testInsert{
    NSNumber* num = [NSNumber numberWithBool:YES];
    [_mModel insertWithQuestion:@"what is your name?" answer:@"jason" favorite:num atIndex:1];
    XCTAssertEqual(6, [_mModel numberOfFlashcards]);
}

-(void) testInsert2{
    [_mModel insertWithQuestion:@"what is your name?" answer:@"jason" favorite:YES];
    XCTAssertEqual(7, [_mModel numberOfFlashcards]);
}

-(void) testRemove1{
    [_mModel removeFlashcard];
    XCTAssertEqual(6, [_mModel numberOfFlashcards]);
}

-(void) testRemove2{
    [_mModel removeFlashcardAtIndex:3];
    XCTAssertEqual(5, [_mModel numberOfFlashcards]);
}

-(void) testFlashCardAtIndex{
    [_mModel flashcardAtIndex:2];
    XCTAssertEqual(2, [_mModel currentIndex]);
}

-(void) testNext{
    [_mModel nextFlashcard];
    XCTAssertEqual(3, [_mModel currentIndex]);
}

-(void) testNextPrev{
    [_mModel prevFlashcard];
    XCTAssertEqual(2, [_mModel currentIndex]);
}

-(void) testFavorite{
    XCTAssertEqual(0, [[_mModel favoriteFlashcards] count]);
}
-(void) testToggle{
    [_mModel flashcardAtIndex:[_mModel numberOfFlashcards] -1];
    [_mModel toggleFavorite];
    XCTAssertEqual(0, [[_mModel favoriteFlashcards] count]);
}


@end
