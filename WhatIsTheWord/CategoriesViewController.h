//
//  CategoriesViewController.h
//  WhatIsTheWord
//
//  Created by Konstantina on 1/28/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoriesViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property  NSString* locationForGame;

@property NSArray *categories;
@property NSMutableArray *players;

@property (weak, nonatomic) IBOutlet UITableView *categoriesTableView;

@end
