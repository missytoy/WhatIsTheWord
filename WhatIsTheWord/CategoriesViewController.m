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
    self.categoriesTableView.dataSource = self;    
    self.categoriesTableView.delegate=self;
    
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath {
    
    
    
    NSString *storyBoardId = @"gameViewControllerId";
    
    GameViewController *gameVC =
    [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
    [self.navigationController pushViewController:gameVC animated:YES];
    
    
//    NSString *categoryStr = [NSString stringWithFormat:@"%@ clicked", data[indexPath.row]];
//    
//    UIAlertController * alert=   [UIAlertController                                  alertControllerWithTitle:categoryStr
//                                  message:@"Category clicked"
//                                  preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction* yesButton = [UIAlertAction
//                                actionWithTitle:@"OK"
//                                style:UIAlertActionStyleDefault
//                                handler:^(UIAlertAction * action)
//                                {
//                                    //Handel your yes please button action here
//                                    
//                                    
//                                }];
//    
//   [alert addAction:yesButton];
//    //        [alert addAction:noButton];
//    
//    [self presentViewController:alert animated:YES completion:nil];
}

@end
