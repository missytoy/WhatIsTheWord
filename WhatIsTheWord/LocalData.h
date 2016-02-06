//
//  LocalData.h
//  WhatIsTheWord
//
//  Created by Konstantina on 1/29/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KKCategory.h"
#import "KKWord.h"
#import "KKCoreDataHelper.h"

@interface LocalData : NSObject


@property NSArray *wordsObjects;//CoreData
@property NSArray *wordsIt;//CoreData
@property NSArray *wordsSongs;//CoreData


@end
