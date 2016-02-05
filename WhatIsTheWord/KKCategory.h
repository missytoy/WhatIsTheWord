//
//  KKCategory.h
//  WhatIsTheWord
//
//  Created by Konstantina on 1/29/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKCategory : NSObject

@property (strong, nonatomic) NSString *categoryName;
@property (strong, nonatomic) NSString *imageStr;
@property (strong, nonatomic) NSArray *words;

-(instancetype)initWithCategoryName: (NSString*) categoryName
                      imageCategory: (NSString*) imageStr;

//
//+(KKCategory*) categoryWithName: (NSString*) categoryName
//                  imageCategory: (NSString*) imageStr;
@end
