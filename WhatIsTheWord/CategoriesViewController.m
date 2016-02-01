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
#import "KKCategoryTableViewCell.h"

NSArray * data;


@implementation CategoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"blankbackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    //using data(array from localdata)
    LocalData * localdata = [[LocalData alloc]init];
    data=localdata.categories;
    
    NSMutableArray *fs = self.players;
    self.categoriesTableView.dataSource = self;    
    self.categoriesTableView.delegate=self;
  //  self.players = [[NSMutableArray alloc]init];
}

-(KKCategoryTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath   {
    
    static NSString *cellIdentifier = @"CategoryCellCustom";
    
    KKCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell ==nil) {
        
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"KKCategoryTableViewCell" owner:self options:nil];
        
        cell = [nibArray objectAtIndex:0];
//        cell = [[KKCategoryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.nameCategory.text = [NSString stringWithFormat:@"%@",data[indexPath.row] ];
    
    
    UIImage *image = [UIImage imageNamed: @"food_category.png"];
    [cell.imageCategory setImage:image];

    
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
    gameVC.categoryName = data[indexPath.row];
    gameVC.players = self.players;
    [self.navigationController pushViewController:gameVC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
