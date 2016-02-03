//
//  StartNewGameViewController.h
//  WhatIsTheWord
//
//  Created by Konstantina on 1/28/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartNewGameViewController : UIViewController  

//IBOutlets
@property (weak, nonatomic) IBOutlet UITextField *addPlayerNameField;
@property (weak, nonatomic) IBOutlet UITextView *allPlayersTextView;
@property (weak, nonatomic) IBOutlet UISwitch *takePlaceSwitch;
@property (weak, nonatomic) IBOutlet UIButton *chooseCategoryButton;

//Info
@property NSMutableArray *players;

@end
