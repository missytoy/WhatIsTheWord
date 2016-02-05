//
//  KKGame.h
//  WhatIsTheWord
//
//  Created by Konstantina on 2/5/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKGame : NSObject

@property (strong,nonatomic) NSString* categoryName;
@property (strong,nonatomic) NSMutableArray* players;
@property (strong,nonatomic) NSDate* playedOn;
@property (strong,nonatomic) NSData* image;
@property (strong,nonatomic) NSString* location;


-(instancetype) init;

@end
