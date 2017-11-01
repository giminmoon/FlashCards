//
//  ViewController.m
//  HW4
//
//  Created by Gimin Moon on 10/21/17.
//  Copyright © 2017 Gimin Moon. All rights reserved.
//

#import "ViewController.h"
#import "FlashcardsModel.h"
#import "Flashcard.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *LabelBox;
@property (nonatomic, strong) FlashcardsModel *flashcardModel;
@property (weak, nonatomic) IBOutlet UILabel *QuestionField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.flashcardModel = [FlashcardsModel sharedModel];
    _LabelBox.text = @"Question";
    _LabelBox.textColor = UIColor.redColor;

    //display first question
    Flashcard* fc = _flashcardModel.randomFlashcard;
    _QuestionField.text = fc.question;

    //taps
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
            action:@selector(singleTapRecognized:)];
    [self.view addGestureRecognizer: singleTap];
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
            action:@selector(doubleTapRecognized:)];
    doubleTap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer: doubleTap];
    
    // Only recognize single taps if they're not the first of two
    [singleTap requireGestureRecognizerToFail: doubleTap];
    
    //swipe
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self
            action:@selector(swipeGestureRecognized:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self
            action:@selector(swipeGestureRecognized:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//show random card
- (void) singleTapRecognized: (UITapGestureRecognizer *) recognizer {
    // Alpha = 0 means the text is transparent
    if (_QuestionField.textColor != UIColor.redColor) {
        _QuestionField.textColor = UIColor.redColor;
    }
    if(_LabelBox.textColor != UIColor.redColor)
    {
        _LabelBox.textColor = UIColor.redColor;
    }
    self.QuestionField.alpha = 0;
    self.LabelBox.alpha = 0;
    
    [UIView animateWithDuration:1.0 animations:^{
        // Fade in the text of the label
        self.QuestionField.alpha = 1;
        self.LabelBox.alpha = 1;
    }];
    
    Flashcard* fc = _flashcardModel.randomFlashcard;
    _QuestionField.text = fc.question;
    _LabelBox.text = @"Question";
    
}

//show random card
- (void) swipeGestureRecognized: (UISwipeGestureRecognizer *) recognizer {
    // Alpha = 0 means the text is transparent
    if (_QuestionField.textColor != UIColor.redColor) {
        _QuestionField.textColor = UIColor.redColor;
    }
    if(_LabelBox.textColor != UIColor.redColor)
    {
        _LabelBox.textColor = UIColor.redColor;
    }
    self.QuestionField.alpha = 0;
    self.LabelBox.alpha = 0;
    [UIView animateWithDuration:1.0 animations:^{
        // Fade in the text of the label
        self.QuestionField.alpha = 1;
        self.LabelBox.alpha = 1;
    }];
    
    Flashcard* fc = _flashcardModel.randomFlashcard;
    _QuestionField.text = fc.question;
    _LabelBox.text = @"Question";
}

//show answer
- (void) doubleTapRecognized: (UITapGestureRecognizer *) recognizer {
    if (_QuestionField.textColor != UIColor.blackColor) {
        _QuestionField.textColor = UIColor.blackColor;
    }
    if(_LabelBox.textColor != UIColor.blackColor)
    {
        _LabelBox.textColor = UIColor.blackColor;
    }
    self.QuestionField.alpha = 0;
    self.LabelBox.alpha = 0;
    [UIView animateWithDuration:1.0 animations:^{
        // Fade in the text of the label
        self.QuestionField.alpha = 1;
        self.LabelBox.alpha = 1;
    }];
    
    _QuestionField.text = [(Flashcard*)[_flashcardModel.flashcards objectAtIndex: _flashcardModel.currentIndex] answer];
    _LabelBox.text = @"Answer";

}

@end
