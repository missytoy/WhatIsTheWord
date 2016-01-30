//
//  GameViewController.m
//  WhatIsTheWord
//
//  Created by Konstantina on 1/28/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import "GameViewController.h"
#import "RankingController.h"

int timerCount;

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"blankbackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    timerCount =5;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:	true];
   
    
}

-(void) count {
    
    timerCount =timerCount -1;
    self.timerLabel.text = [NSString stringWithFormat:@"%d",timerCount];
    if(timerCount == 0){
        [self.timer invalidate];
        self.timerLabel.text= [NSString stringWithFormat:@"60"];
        
        
        NSString *storyBoardId = @"rankingControllerId";
        
        RankingController *rankingVC =
        [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
        [self.navigationController pushViewController:rankingVC  animated:YES];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
