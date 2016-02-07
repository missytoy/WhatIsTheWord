//
//  RankingController.h
//  WhatIsTheWord
//
//  Created by Konstantina on 1/30/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KKMusicPlayer.h"

@interface RankingController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *resultTextView;
@property (weak, nonatomic) IBOutlet UIButton *goToMainPageFromRankingButton;


@property(strong,nonatomic) KKMusicPlayer* soundPlayer;

//CORE
@property NSMutableArray *players;
@property NSData *imageForGame;
@property  NSString* locationForGame;
@property  NSString* categoryNameForGame;


@end
