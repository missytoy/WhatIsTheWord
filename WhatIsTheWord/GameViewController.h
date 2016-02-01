//
//  GameViewController.h
//  WhatIsTheWord
//
//  Created by Konstantina on 1/28/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController

//IBOutlets
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIButton *nextWordButton;
@property (weak, nonatomic) IBOutlet UIButton *correctWordButton;

@property (weak, nonatomic) IBOutlet UILabel *randomWordLabel;

@property (weak, nonatomic) IBOutlet UIButton *nextPlayerButton;

//CORE
@property NSString *categoryName;
@property NSArray *players;
@property NSMutableArray *scores;

-(void) count;

-(int)getRandomNumberBetween:(int)from to:(int)to;

@end
