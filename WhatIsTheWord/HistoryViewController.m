//
//  HistoryViewController.m
//  WhatIsTheWord
//
//  Created by Konstantina on 1/28/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import "HistoryViewController.h"
#import "ViewController.h"

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.title = @"History";
    // self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blankbackground.png"]];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"history.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    self.backToHistoryButton.hidden=YES;
}

- (IBAction)backButton:(id)sender {
    [self performSelectorOnMainThread:@selector(showAndHide) withObject:nil waitUntilDone:NO];
    
}



- (IBAction)goToMainPageClicked:(id)sender {
    
    NSString *storyBoardId = @"mainViewControllerId";
    
    ViewController *mainVC =
    [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
    [self.navigationController pushViewController:mainVC  animated:YES];
}


-(void)showAndHide
{
    self.backToHistoryButton.hidden = YES;
    self.goToMainPageFromHistory.hidden = NO;    
}
//
//-(void)fetchData{
//    
//    self.dbHelper = [[KKCoreDataHelper alloc]init];
//    [self.dbHelper setupCoreData];
//    //zagrubenqk grubeshtastnik
//    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Player" ];
//    NSSortDescriptor *sortDesriptor = [NSSortDescriptor sortDescriptorWithKey:@"score" ascending:YES];
//    
//    [request setSortDescriptors:[NSArray arrayWithObject:sortDesriptor] ];
//    
//    NSArray* seeme = [self.dbHelper.context executeFetchRequest:request error:nil];
//    
//    for (Player *player in seeme) {
//        NSLog(@"%@ %@",player.playerName,player.score);
//    }
//    
//}

@end
