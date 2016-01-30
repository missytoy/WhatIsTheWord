//
//  HistoryViewController.m
//  WhatIsTheWord
//
//  Created by Konstantina on 1/28/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import "HistoryViewController.h"

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blankbackground.png"]];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"history.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    self.goToMainPageFromHistory.hidden=YES;
    

}
- (IBAction)backButton:(id)sender {
     [self performSelectorOnMainThread:@selector(showAndHide) withObject:nil waitUntilDone:NO];
    
}

- (IBAction)goToMainPageClicked:(id)sender {
    [self performSelectorOnMainThread:@selector(showAndHide) withObject:nil waitUntilDone:NO];
}



-(void)showAndHide
{
    if (self.goToMainPageFromHistory.hidden == NO) {
        self.backToHistoryButton.hidden=NO;
        self.goToMainPageFromHistory.hidden = YES;
    }else if(self.goToMainPageFromHistory.hidden == YES){
        self.backToHistoryButton.hidden=YES;
        self.goToMainPageFromHistory.hidden = NO;

    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
