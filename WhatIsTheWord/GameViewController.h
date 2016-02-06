//
//  GameViewController.h
//  WhatIsTheWord
//
//  Created by Konstantina on 1/28/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WordCategory.h"

@interface GameViewController : UIViewController

//IBOutlets
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIButton *nextWordButton;
@property (weak, nonatomic) IBOutlet UIButton *correctWordButton;

@property (weak, nonatomic) IBOutlet UILabel *randomWordLabel;

@property (weak, nonatomic) IBOutlet UIButton *nextPlayerButton;
@property (weak, nonatomic) IBOutlet UITextView *currentPlayerInfoTextView;
@property (weak, nonatomic) IBOutlet UILabel *howLabel;
@property (weak, nonatomic) IBOutlet UILabel *toPlayLabel;

//CORE
@property WordCategory* categoryForWords;
@property NSMutableArray *players;


-(void) count;

-(int)getRandomNumberBetween:(int)from to:(int)to;

@end
