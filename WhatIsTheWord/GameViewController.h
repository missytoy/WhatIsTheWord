//
//  GameViewController.h
//  WhatIsTheWord
//
//  Created by Konstantina on 1/28/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property NSTimer *timer;
@property (weak, nonatomic) IBOutlet UILabel *randomWordLabel;


@property NSString *categoryName;
@property NSArray *players;

-(void) count;

-(int)getRandomNumberBetween:(int)from to:(int)to;

@end
