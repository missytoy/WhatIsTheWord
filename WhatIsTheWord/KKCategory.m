//
//  KKCategory.m
//  WhatIsTheWord
//
//  Created by Konstantina on 1/29/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import "KKCategory.h"

@implementation KKCategory


-(instancetype)initWithCategoryName: (NSString*) categoryName
                      imageCategory: (NSString*) imageStr{
    
    self = [super init];
    if (self) {
        
        self.categoryName = categoryName;
        self.imageStr = imageStr;
        self.words = [[NSMutableArray alloc]init];
    }
    
    return self;
}
@end
