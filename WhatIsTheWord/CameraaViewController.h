//
//  CameraaViewController.h
//  WhatIsTheWord
//
//  Created by Konstantina on 2/2/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "KKMusicPlayer.h"

@interface CameraaViewController : UIViewController{
    IBOutlet UIView *frameforcapture;
    IBOutlet UIImageView *imageView;
}


@property(strong,nonatomic) KKMusicPlayer* soundPlayer;

//CORE
@property NSMutableArray *players;
@property NSData *image;
@property  NSString* locationForGame;

-(IBAction)takePhoto:(id)sender;

@end
