//
//  KKGame.m
//  WhatIsTheWord
//
//  Created by Konstantina on 2/5/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import "KKGame.h"

@implementation KKGame


-(instancetype) init{
    
    self = [super init];
    if (self) {
        self.players = [[NSMutableArray alloc]init];
    }
    
    return self;
    
}

@end
