//
//  KKWord.m
//  WhatIsTheWord
//
//  Created by Konstantina on 2/5/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import "KKWord.h"

@implementation KKWord

-(instancetype) initWithContent:(NSString*) content{
    
    self = [super init];
    if (self) {
      
        self.content = content;
    }
    
    return self;    
}

@end
