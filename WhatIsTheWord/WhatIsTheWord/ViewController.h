//
//  ViewController.h
//  WhatIsTheWord
//
//  Created by Konstantina on 1/24/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKMusicPlayer.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *startGameButton;

@property(strong,nonatomic) KKMusicPlayer* soundPlayer;

@end

