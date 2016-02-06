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
@property (strong, nonatomic) NSString *image;
@property (strong, nonatomic) NSMutableArray *words;

-(instancetype)initWithCategoryName: (NSString*) categoryName
                      image: (NSString*) image;

//
//+(KKCategory*) categoryWithName: (NSString*) categoryName
//                  imageCategory: (NSString*) imageStr;
@end
