//
//  KKMusicPlayer.h
//  WhatIsTheWord
//
//  Created by Konstantina on 2/7/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface KKMusicPlayer : NSObject

@property(strong,nonatomic) AVAudioPlayer* soundPlayer;

-(void)playSound:(NSString*) soundFileName;

@end
