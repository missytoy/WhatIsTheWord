//
//  Player+CoreDataProperties.h
//  WhatIsTheWord
//
//  Created by Konstantina on 2/4/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Player.h"

NS_ASSUME_NONNULL_BEGIN

@interface Player (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *playerName;
@property (nullable, nonatomic, retain) NSNumber *score;
@property (nullable, nonatomic, retain) NSManagedObject *game;

@end

NS_ASSUME_NONNULL_END
