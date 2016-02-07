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
#import "KKWord.h"
#import "WhatIsTheWord-Swift.h"


int timerCount;
//NSArray *dataObjects;
int currentPlayerScore ;
int countWords;
int indexOfPlayer;
NSString *playerNameTurn;
NSMutableArray *arrayForRandomWord;


@implementation GameViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.soundPlayer= [[KKMusicPlayer alloc]init];
    [self.soundPlayer playSound:@"letitbegin"];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"howtoplay.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    self.nextWordButton.hidden = YES;
    self.correctWordButton.hidden = YES;
    self.randomWordLabel.hidden = YES;
    self.timerLabel.hidden = YES;
    
    self.howLabel.hidden = YES;
    self.toPlayLabel.hidden = YES;
    NSLog(@"%@",[self.players[1] playerName]);
    self.currentPlayerInfoTextView.text = [NSString stringWithFormat:@"-If someone guesses your word click on correct button. \n\n-If you can't explain the word click next word button. "];
    self.currentPlayerInfoTextView.textColor = [UIColor purpleColor];
    self.currentPlayerInfoTextView.font = [UIFont fontWithName:@"Papyrus" size:20];
    indexOfPlayer = 0;
    timerCount = 5;
    currentPlayerScore = 0;
    
  
    playerNameTurn = [NSString stringWithFormat:@"%@'s turn",[self.players[indexOfPlayer] playerName]];
    
    [self.nextPlayerButton setTitle:playerNameTurn forState:UIControlStateNormal];
    
    countWords = (int)self.categoryForWords.words.count - 1;
    
    NSInteger randomNumber = [self getRandomNumberBetween:0 to:countWords];
    arrayForRandomWord = [NSMutableArray arrayWithArray:[self.categoryForWords.words allObjects]];
    self.randomWordLabel.text = [arrayForRandomWord[randomNumber] content];
    
    UISwipeGestureRecognizer *swipeLeftGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft:)];
    [swipeLeftGestureRecognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [self.view addGestureRecognizer:swipeLeftGestureRecognizer];
    
    
        UISwipeGestureRecognizer *rightSwipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                                   action:@selector(swipeRight:)];
    
        UISwipeGestureRecognizer *leftSwipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                                  action:@selector(swipeLeft:)];
        leftSwipeRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    
        [self.view addGestureRecognizer:rightSwipeRecognizer];
        [self.view addGestureRecognizer:leftSwipeRecognizer];
   

}


- (IBAction)swipeRight:(UISwipeGestureRecognizer *)sender {
    [self nextWord];
    
}

- (IBAction)swipeLeft:(UISwipeGestureRecognizer *)sender {
    [self correctWord];
}

- (IBAction)correctOnClickBtn:(id)sender {
    [self correctWord];
    
}
- (IBAction)nextOnClickBtn:(id)sender {
    [self nextWord];
}


- (IBAction)onNextPlayerClick:(id)sender {
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"blankbackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
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
            
            NSNumber *currentScore = [NSNumber numberWithInt:currentPlayerScore];
            
            [self.players[indexOfPlayer] setValue:currentScore forKey:@"scorePlayer"];
            
            NSLog(@"%ld",(long)[self.players[indexOfPlayer] scorePlayer]);
            
            RankingController *rankingVC =
            [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
            rankingVC.players = self.players;
            rankingVC.locationForGame = self.locationForGame;
            rankingVC.categoryNameForGame = self.categoryForWords.categoryName;
            
            NSLog(@"%@",[self.players[0] playerName]);
            NSLog(@"%ld",(long)[self.players[0] scorePlayer]);
            
            [self.navigationController pushViewController:rankingVC  animated:YES];
            
        }else{
            self.nextWordButton.hidden = YES;
            self.correctWordButton.hidden = YES;
            self.randomWordLabel.hidden = YES;
            self.timerLabel.hidden = YES;
            self.nextPlayerButton.hidden = NO;
            self.currentPlayerInfoTextView.hidden = NO;
            
            
            NSNumber *currentScore = [NSNumber numberWithInt:currentPlayerScore];
            
            [self.players[indexOfPlayer] setValue:currentScore forKey:@"scorePlayer"];
            currentPlayerScore=0;
            
            UIGraphicsBeginImageContext(self.view.frame.size);
            [[UIImage imageNamed:@"current_user_score_with_score.png"] drawInRect:self.view.bounds];
            UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            self.view.backgroundColor = [UIColor colorWithPatternImage:image];
     
            
            NSString *plName =[self.players[indexOfPlayer] playerName];
            NSInteger plScore =(NSInteger)[self.players[indexOfPlayer] scorePlayer];
            
            self.currentPlayerInfoTextView.text =[NSString stringWithFormat:@"%@ has %ld score",plName,plScore];
            
            indexOfPlayer++;
            NSString *playerNameTurn = [NSString stringWithFormat:@"%@'s turn",[self.players[indexOfPlayer] playerName]];
            
            [self.nextPlayerButton setTitle:playerNameTurn forState:UIControlStateNormal];
            
            self.currentPlayerInfoTextView.textColor = [UIColor purpleColor];
            self.currentPlayerInfoTextView.font = [UIFont fontWithName:@"Papyrus" size:25];
            
           
            
        }
        
    }
}

-(void)correctWord{
    
    NSInteger randomNumber = [self getRandomNumberBetween:0 to:countWords];
    self.randomWordLabel.text = [arrayForRandomWord[randomNumber] content];
    currentPlayerScore++;
}

-(void)nextWord{
    
    NSInteger randomNumber = [self getRandomNumberBetween:0 to:countWords];
    self.randomWordLabel.text = [arrayForRandomWord[randomNumber] content];
}


-(int)getRandomNumberBetween:(int)from to:(int)to {
    
    return (int)from + arc4random() % (to-from+1);
}



@end
