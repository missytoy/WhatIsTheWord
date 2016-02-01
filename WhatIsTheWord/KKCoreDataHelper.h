//
//  KKCoreDataHelper.h
//  WhatIsTheWord
//
//  Created by Konstantina on 1/31/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface KKCoreDataHelper : NSObject

@property(nonatomic,strong) NSManagedObjectContext* context;
@property(nonatomic, strong) NSManagedObjectModel* model;
@property(nonatomic, strong) NSPersistentStoreCoordinator* coordinator;
@property(nonatomic, strong) NSPersistentStore* store;

- (void)saveContext;
- (void)setupCoreData;


@end
