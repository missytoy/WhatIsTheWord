//
//  GameViewController.m
//  WhatIsTheWord
//
//  Created by Konstantina on 1/28/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import "GameViewController.h"
#import "RankingController.h"
#import "CameraaViewController.h"
#import "LocalData.h"


int timerCount;
NSArray *dataObjects;
int currentPlayerScore ;
int countWords;
int indexOfPlayer;
NSString *playerNameTurn;



@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"player_first_page.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    self.nextWordButton.hidden = YES;
    self.correctWordButton.hidden = YES;
    self.randomWordLabel.hidden = YES;
    self.timerLabel.hidden = YES;
    
    self.howLabel.hidden = YES;
    self.toPlayLabel.hidden = YES;
    
    self.currentPlayerInfoTextView.text = [NSString stringWithFormat:@"-If someone guesses your word click on correct button. \n\n-If you can't explain the word click next word button. "];
    self.currentPlayerInfoTextView.textColor = [UIColor purpleColor];
    self.currentPlayerInfoTextView.font = [UIFont fontWithName:@"Papyrus" size:20];
    self.scores = [[NSMutableArray alloc]init];
    indexOfPlayer = 0;
    timerCount = 5;
    currentPlayerScore = 0;
    
    playerNameTurn = [NSString stringWithFormat:@"%@'s turn",self.players[indexOfPlayer]];
    
    [self.nextPlayerButton setTitle:playerNameTurn forState:UIControlStateNormal];
    
    LocalData * localdata = [[LocalData alloc]init];
    
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
    currentPlayerScore++;
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
    //    self.howLabel.hidden = YES;
    //    self.toPlayLabel.hidden = YES;
    
    self.nextWordButton.hidden = NO;
    self.correctWordButton.hidden = NO;
    self.randomWordLabel.hidden = NO;
    self.timerLabel.hidden = NO;
    self.nextPlayerButton.hidden = YES;
    self.currentPlayerInfoTextView.hidden = YES;
    
    timerCount = 5;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:	true];
    
}

-(void) count {
    
    timerCount =timerCount -1;
    self.timerLabel.text = [NSString stringWithFormat:@"%d",timerCount];
    if(timerCount < 0){
        [self.timer invalidate];
        self.timerLabel.text= [NSString stringWithFormat:@"60"];
        
        NSUInteger maxPlayersCount = self.players.count -1;
        if (maxPlayersCount == indexOfPlayer) {
            
            NSString *storyBoardId = @"rankingControllerId";
            
            self.scores[indexOfPlayer] =[NSNumber numberWithInt:currentPlayerScore];
            RankingController *rankingVC =
            [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
            rankingVC.players = self.players;
            rankingVC.scores = self.scores;
            [self.navigationController pushViewController:rankingVC  animated:YES];
            
        }else{
            self.nextWordButton.hidden = YES;
            self.correctWordButton.hidden = YES;
            self.randomWordLabel.hidden = YES;
            self.timerLabel.hidden = YES;
            self.nextPlayerButton.hidden = NO;
            self.currentPlayerInfoTextView.hidden = NO;
            
            
            self.scores[indexOfPlayer] =[NSNumber numberWithInt:currentPlayerScore];
            currentPlayerScore=0;
            
            UIGraphicsBeginImageContext(self.view.frame.size);
            [[UIImage imageNamed:@"current_user_score_with_score.png"] drawInRect:self.view.bounds];
            UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            self.view.backgroundColor = [UIColor colorWithPatternImage:image];
            self.currentPlayerInfoTextView.text =[NSString stringWithFormat:@"%@ has %@ scores",self.players[indexOfPlayer],self.scores[indexOfPlayer]];
            
            indexOfPlayer++;
            NSString *playerNameTurn = [NSString stringWithFormat:@"%@'s turn",self.players[indexOfPlayer]];
            
            [self.nextPlayerButton setTitle:playerNameTurn forState:UIControlStateNormal];
            
            self.currentPlayerInfoTextView.textColor = [UIColor purpleColor];
            self.currentPlayerInfoTextView.font = [UIFont fontWithName:@"Papyrus" size:25];
            
            
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
