//
//  GameViewController.m
//  WhatIsTheWord
//
//  Created by Konstantina on 1/28/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import "GameViewController.h"
#import "RankingController.h"
#import "LocalData.h"

int timerCount;
NSArray *dataObjects;
int score ;
int countWords;
@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"blankbackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    timerCount =5;
    score = 0;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:	true];
    
    LocalData * localdata = [[LocalData alloc]init];
    self.scores = [[NSMutableArray alloc]init];
    
    
    if([self.categoryName  isEqual: @"Songs"]){
        
        dataObjects=localdata.wordsSongs;
        
    }else if([self.categoryName  isEqual: @"Object"]){
        
        dataObjects=localdata.wordsObjects;
        
    }else{
        dataObjects=localdata.wordsAnimals;
    }
    countWords = (int)dataObjects.count - 1;
    
    NSInteger randomNumber = [self getRandomNumberBetween:0 to:countWords];
    self.randomWordLabel.text = dataObjects[randomNumber];
    
}
- (IBAction)correctOnClickBtn:(id)sender {
    
    NSInteger randomNumber = [self getRandomNumberBetween:0 to:countWords];
    self.randomWordLabel.text = dataObjects[randomNumber];
    score++;
  //NSLog([NSString stringWithFormat:@"%d",score]);
}
- (IBAction)nextOnClickBtn:(id)sender {
    
    NSInteger randomNumber = [self getRandomNumberBetween:0 to:countWords];
    self.randomWordLabel.text = dataObjects[randomNumber];
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
        rankingVC.players = self.players;
        [self.navigationController pushViewController:rankingVC  animated:YES];
        
    }
}

-(int)getRandomNumberBetween:(int)from to:(int)to {
    
    return (int)from + arc4random() % (to-from+1);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
