//
//  StartNewGameViewController.m
//  WhatIsTheWord
//
//  Created by Konstantina on 1/28/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import "StartNewGameViewController.h"
#import "CategoriesViewController.h"

@implementation StartNewGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"blankbackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    [self.allPlayersTextView.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [self.allPlayersTextView.layer setBorderWidth:2.0];
    self.allPlayersTextView.layer.cornerRadius = 10;
    self.allPlayersTextView.clipsToBounds = YES;
    self.players = [[NSMutableArray alloc]init];
    
}
- (IBAction)onChooseCategoryClick:(id)sender {
    
    NSString *storyBoardId = @"categoriesViewControllerId";
    
    CategoriesViewController *categoriesVC =
    [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
    categoriesVC.players = self.players;
    [self.navigationController pushViewController:categoriesVC animated:YES];
    
}
- (IBAction)addPlayerButton:(id)sender {
    
    if(self.addPlayerNameField.text.length > 10 ){
        
        UIAlertController * alert=   [UIAlertController                                  alertControllerWithTitle:@"Name Error"                                                                                                          message:@"Player's name must be less than 11"                                                                                                   preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* yesButton = [UIAlertAction
                                    actionWithTitle:@"OK"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action)
                                    {
                                        //Handel your yes please button action here
                                        
                                        
                                    }];
        
        [alert addAction:yesButton];
        [self presentViewController:alert animated:YES completion:nil];
        
        
        self.addPlayerNameField.text = @"";
    }else if(self.addPlayerNameField.text.length <1){
        
        UIAlertController * alert=   [UIAlertController                                  alertControllerWithTitle:@"Name Error"
           message:@"Player's name can't be empty"preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* yesButton = [UIAlertAction
                                    actionWithTitle:@"OK"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action)
                                    {
                                        //Handel your yes please button action here
                                        
                                        
                                    }];
        
        [alert addAction:yesButton];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        
        NSString *playerToAdd = [NSString stringWithFormat:@"%@ \n%@",
                                 self.allPlayersTextView.text,self.addPlayerNameField.text];
        self.allPlayersTextView.text =playerToAdd;
        
        [self.players insertObject:self.addPlayerNameField.text atIndex:0 ];
             self.addPlayerNameField.text = @"";
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
