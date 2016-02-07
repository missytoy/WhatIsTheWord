//
//  CategoriesViewController.m
//  WhatIsTheWord
//
//  Created by Konstantina on 1/28/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import "CategoriesViewController.h"
#import "LocalData.h"
#import "GameViewController.h"
#import "KKCoreDataHelper.h"
#import "WordCategory.h"
#import "KKCategoryTableViewCell.h"

NSArray * data;

@interface CategoriesViewController()
@property (strong,nonatomic) KKCoreDataHelper* dbHelper;

@end

@implementation CategoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"blankbackground.png"] drawInRect:self.view.bounds];
    UIImage *imagee = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:imagee];
    
    //using data(array from localdata)

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString* key = @"seeded";
    
    if ([defaults objectForKey:key]) {
        const BOOL didSeededCategory = [defaults boolForKey:key];
        if (didSeededCategory == YES) {
            //
        }
    }else{
        LocalData * localdata = [[LocalData alloc]init];
        [localdata seedData];
        [defaults setBool:YES forKey:key];
        [defaults synchronize];
    }
    //data=localdata.categories;
    
    self.categoriesTableView.dataSource = self;    
    self.categoriesTableView.delegate=self;
  //  self.players = [[NSMutableArray alloc]init];
    
    
    self.dbHelper = [[KKCoreDataHelper alloc]init];
    [self.dbHelper setupCoreData];
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"WordCategory" ];
    
   data = [self.dbHelper.context executeFetchRequest:request error:nil];
    
    for (WordCategory *category in data) {
       NSLog(@"%@ ",category.categoryName);
         NSLog(@"%@ ",category.image);
        
    }
}

-(KKCategoryTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath   {
    
    NSLog(@"%@ ",data[indexPath.row] );
   
    static NSString *cellIdentifier = @"CategoryCellCustom";
    
    KKCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell ==nil) {
        
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"KKCategoryTableViewCell" owner:self options:nil];
        
        cell = [nibArray objectAtIndex:0];
    }
    
    cell.nameCategory.text = [NSString stringWithFormat:@"%@",[data[indexPath.row] categoryName] ];
    
    
    UIImage *imageForCategory = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[data[indexPath.row] image] ]];
    
    [cell.imageCategory setImage:imageForCategory];

    
    cell.nameCategory.textAlignment = NSTextAlignmentCenter;
    cell.nameCategory.font = [ UIFont fontWithName: @"Papyrus" size: 30.0 ];
    cell.nameCategory.textColor =[ UIColor whiteColor];
    
    [cell setBackgroundColor:[UIColor clearColor]];
    [self.categoriesTableView setBackgroundColor:[UIColor clearColor] ];    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section  {
    return data.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath {
    
    
    
    NSString *storyBoardId = @"gameViewControllerId";
    
    GameViewController *gameVC =
    [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
    gameVC.categoryForWords = data[indexPath.row];
    gameVC.players = self.players;
    gameVC.locationForGame = self.locationForGame;
    [self.navigationController pushViewController:gameVC animated:YES];
    
}

@end
