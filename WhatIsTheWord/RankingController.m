//
//  RankingController.m
//  WhatIsTheWord
//
//  Created by Konstantina on 1/30/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import "RankingController.h"
#import "ViewController.h"
#import "CameraaViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "KKCoreDataHelper.h"
#import "Game.h"
#import "Player.h"
#import "WhatIsTheWord-Swift.h"

@interface RankingController()
@property (strong,nonatomic) KKCoreDataHelper* dbHelper;

@end


bool firstTimeEntered = YES;

@implementation RankingController 


- (void)viewDidLoad {
    
    [super viewDidLoad];
     self.title = @"Ranking";
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"rankingg.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
//      NSLog(@"%@",[self.players[0] playerName]);
//    
//    NSInteger fd =(NSInteger) [self.players[0] scorePlayer];
//    NSLog(@"%ld",fd);
    
    if (firstTimeEntered) {
        [self saveResult];
       
        //firstTimeEntered = NO;
    }
    
    
    [self fetchData];
   
    [self displayResult];
    
    
    
//    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"letitbegin" ofType:@"mp3"]];
//    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
//    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
//    [[AVAudioSession sharedInstance] setActive: YES error: nil];
//    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
//    [audioPlayer play];
//    [super viewDidLoad];
}

-(void)fetchData{

    self.dbHelper = [[KKCoreDataHelper alloc]init];
    [self.dbHelper setupCoreData];
    //zagrubenqk grubeshtastnik
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Player" ];
    NSSortDescriptor *sortDesriptor = [NSSortDescriptor sortDescriptorWithKey:@"score" ascending:YES];
    
    [request setSortDescriptors:[NSArray arrayWithObject:sortDesriptor] ];
    
    NSArray* seeme = [self.dbHelper.context executeFetchRequest:request error:nil];
    
    for (Player *player in seeme) {
        NSLog(@"%@ %@",player.playerName,player.score);
    }
    
}

-(void)saveResult{
    
    self.dbHelper = [[KKCoreDataHelper alloc]init];
    [self.dbHelper setupCoreData];
    
    Game* game = [NSEntityDescription insertNewObjectForEntityForName:@"Game" inManagedObjectContext:self.dbHelper.context];
    
    for (NSInteger i =0; i<self.players.count; i++) {
        Player* player= [NSEntityDescription insertNewObjectForEntityForName:@"Player" inManagedObjectContext:self.dbHelper.context];
        
        NSString *pName =[self.players[i] playerName];
        NSNumber *pScore= [NSNumber numberWithInt:(int)[self.players[i] scorePlayer]];

        
        
        [player setValue:pName forKey:@"playerName"];
        [player setValue:pScore forKey:@"score"];
   
        NSLog(@"%@ ",player.playerName);
        NSLog(@"%@ ",player.score);
        
        [game addPlayersObject:player];
    }
    
    
    [self.dbHelper.context insertObject:game];
    [self.dbHelper saveContext];
}

-(void)displayResult{
    
    NSString *rankingResult =@"";
    
    
    for (NSInteger i =0; i<self.players.count; i++) {
     NSString *currentResult = [NSString stringWithFormat:@"%@ (%ld scores)", [self.players[i] playerName],(long)[self.players[i] scorePlayer]];
   
        rankingResult = [NSString stringWithFormat:@"%@ \n %ld. %@",rankingResult,(long)i +1 ,currentResult];
        
    }
    
    
    self.resultTextView.text  = rankingResult;
    self.resultTextView.textColor = [UIColor purpleColor];
    self.resultTextView.font = [UIFont fontWithName:@"Papyrus" size:20];
}

- (IBAction)takePhotoOnOtherPage:(id)sender {
    
    
    //  CameraaViewControllerId
    NSString *storyBoardId = @"cameraaViewControllerId";
    
    CameraaViewController *cameraVC =
    [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
    cameraVC.players = self.players;
    firstTimeEntered = NO;

    [self.navigationController pushViewController:cameraVC  animated:YES];
}


- (IBAction)goToMainageFromRanking:(id)sender {
    
    NSString *storyBoardId = @"mainViewControllerId";
    firstTimeEntered =YES;
    ViewController *mainVC =
    [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
    [self.navigationController pushViewController:mainVC  animated:YES];
}


@end
