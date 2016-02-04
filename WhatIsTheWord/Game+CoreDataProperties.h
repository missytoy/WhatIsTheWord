//
//  Game+CoreDataProperties.h
//  WhatIsTheWord
//
//  Created by Konstantina on 2/4/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Game.h"

NS_ASSUME_NONNULL_BEGIN

@interface Game (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *datePlayedOn;
@property (nullable, nonatomic, retain) NSString *location;
@property (nullable, nonatomic, retain) NSData *image;
@property (nullable, nonatomic, retain) NSString *categoryName;
@property (nullable, nonatomic, retain) NSSet<Player *> *players;

@end

@interface Game (CoreDataGeneratedAccessors)

- (void)addPlayersObject:(Player *)value;
- (void)removePlayersObject:(Player *)value;
- (void)addPlayers:(NSSet<Player *> *)values;
- (void)removePlayers:(NSSet<Player *> *)values;

@end

NS_ASSUME_NONNULL_END
