//
//  RankingController.h
//  WhatIsTheWord
//
//  Created by Konstantina on 1/30/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RankingController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *resultTextView;
@property (weak, nonatomic) IBOutlet UIButton *goToMainPageFromRankingButton;


//CORE
@property NSMutableArray *players;
@property NSData *imageForGame;
@property  NSString* location;
@property  NSString* categoryNameForGame;


@end
