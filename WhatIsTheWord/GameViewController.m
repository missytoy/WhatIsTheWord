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
int indexOfPlayer;

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"blankbackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    self.nextPlayerButton.hidden = YES;
    timerCount =5;
    score = 0;
    indexOfPlayer = 0;
    
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

- (IBAction)onNextPlayerClick:(id)sender {
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"blankbackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    indexOfPlayer++;
    timerCount = 5;
    self.nextWordButton.hidden = NO;
    self.correctWordButton.hidden = NO;
    self.randomWordLabel.hidden = NO;
    self.timerLabel.hidden = NO;
    self.nextPlayerButton.hidden = YES;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:	true];
    
}

-(void) count {
    
    timerCount =timerCount -1;
    self.timerLabel.text = [NSString stringWithFormat:@"%d",timerCount];
    if(timerCount == 0){
        [self.timer invalidate];
        self.timerLabel.text= [NSString stringWithFormat:@"60"];
       
        NSUInteger maxPlayersCount = self.players.count -1;
        if (maxPlayersCount == indexOfPlayer) {
            
                    NSString *storyBoardId = @"rankingControllerId";
            
                    RankingController *rankingVC =
                    [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
                    rankingVC.players = self.players;
                    [self.navigationController pushViewController:rankingVC  animated:YES];
        }else{
        self.nextWordButton.hidden = YES;
        self.correctWordButton.hidden = YES;
        self.randomWordLabel.hidden = YES;
        self.timerLabel.hidden = YES;
        self.nextPlayerButton.hidden = NO;
            
            UIGraphicsBeginImageContext(self.view.frame.size);
            [[UIImage imageNamed:@"all_score_with_score.png"] drawInRect:self.view.bounds];
            UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            self.view.backgroundColor = [UIColor colorWithPatternImage:image];
            
            NSString *playerNameTurn = [NSString stringWithFormat:@"%@'s turn",self.players[indexOfPlayer]];
            
           [self.nextPlayerButton setTitle:playerNameTurn forState:UIControlStateNormal];
        
        }
        
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
