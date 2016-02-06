//
//  KKPlayer.h
//  WhatIsTheWord
//
//  Created by Konstantina on 2/5/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKPlayer : NSObject

@property (strong,nonatomic) NSString* playerName;
@property int score;



-(instancetype) initWithName:(NSString*) name;

@end
