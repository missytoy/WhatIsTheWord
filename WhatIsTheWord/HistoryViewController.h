//
//  HistoryViewController.h
//  WhatIsTheWord
//
//  Created by Konstantina on 1/28/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *historyInfoTableView;
@property (weak, nonatomic) IBOutlet UIButton *goToMainPageFromHistory;
@property (weak, nonatomic) IBOutlet UIButton *backToHistoryButton;
@property (weak, nonatomic) IBOutlet UITextView *detailInfoForSelectedGame;
@property (weak, nonatomic) IBOutlet UIImageView *imageGame;

@end
