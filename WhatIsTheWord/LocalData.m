//
//  LocalData.m
//  WhatIsTheWord
//
//  Created by Konstantina on 1/29/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import "LocalData.h"

@implementation LocalData

-(instancetype) init{
    
    self = [super init];
    if (self) {
        self.categories = @[@"Object",@"Songs",@"Animals"];
    }
    
    return self;
}
@end
