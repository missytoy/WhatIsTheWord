//
//  Word+CoreDataProperties.h
//  WhatIsTheWord
//
//  Created by Konstantina on 2/4/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Word.h"

NS_ASSUME_NONNULL_BEGIN

@interface Word (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *content;
@property (nullable, nonatomic, retain) WordCategory *wordCategory;

@end

NS_ASSUME_NONNULL_END
