//
//  CategoriesViewController.m
//  WhatIsTheWord
//
//  Created by Konstantina on 1/28/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import "CategoriesViewController.h"
#import "LocalData.h"

NSArray * data;


@implementation CategoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blankbackground.png"]];
    
    LocalData * localdata = [[LocalData alloc]init];
    data=localdata.categories;
    self.categoriesTableView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath   {
    
    static NSString *cellIdentifier = @"CategoryCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell ==nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",data[indexPath.row] ];
    
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = [ UIFont fontWithName: @"Papyrus" size: 30.0 ];
    cell.textLabel.textColor =[ UIColor whiteColor];
    
    [cell setBackgroundColor:[UIColor clearColor]];
    [self.categoriesTableView setBackgroundColor:[UIColor clearColor] ];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section  {
    return data.count;
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath {
//    
//    DMPhone *phone = [self.phones objectAtIndex:indexPath.row];
//    NSString *storyBoardId = @"detailsScene";
//    
//    PhoneDetailsViewController *detailsVC =
//    [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
//    detailsVC.phone = phone;
//    
//    //         AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
//    //    appDelegate.window.rootViewController = detailsVC;
//    [self.navigationController pushViewController:detailsVC animated:YES];
//}

@end
