//
//  WordCategory+CoreDataProperties.h
//  WhatIsTheWord
//
//  Created by Konstantina on 2/4/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "WordCategory.h"

NS_ASSUME_NONNULL_BEGIN

@interface WordCategory (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *categoryName;
@property (nullable, nonatomic, retain) NSString *image;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *words;

@end

@interface WordCategory (CoreDataGeneratedAccessors)

- (void)addWordsObject:(NSManagedObject *)value;
- (void)removeWordsObject:(NSManagedObject *)value;
- (void)addWords:(NSSet<NSManagedObject *> *)values;
- (void)removeWords:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
