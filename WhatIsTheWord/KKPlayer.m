//
//  KKPlayer.m
//  WhatIsTheWord
//
//  Created by Konstantina on 2/5/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import "KKPlayer.h"

@implementation KKPlayer

-(instancetype) initWithName:(NSString*) name{
    
    self = [super init];
    if (self) {
        
        self.playerName = name;
    }
    
    return self;
}
@end
