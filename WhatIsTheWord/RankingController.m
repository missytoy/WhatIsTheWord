//
//  RankingController.m
//  WhatIsTheWord
//
//  Created by Konstantina on 1/30/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import "RankingController.h"
#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@implementation RankingController 

- (void)viewDidLoad {
    
    [super viewDidLoad];
     self.title = @"Ranking";
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"ranking.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    NSString *rankingResult =@"";
    
    for (NSInteger i =0; i<self.players.count; i++) {
        NSString *currentResult = [NSString stringWithFormat:@"%@ (%@ scores)", self.players[i],self.scores[i]];
        
        rankingResult = [NSString stringWithFormat:@"%@ \n %ld. %@",rankingResult,(long)i +1 ,currentResult];
    }
    
    self.resultTextView.text  = rankingResult;
    self.resultTextView.textColor = [UIColor purpleColor];
    self.resultTextView.font = [UIFont fontWithName:@"Papyrus" size:20];
//    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"letitbegin" ofType:@"mp3"]];
//    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
//    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
//    [[AVAudioSession sharedInstance] setActive: YES error: nil];
//    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
//    [audioPlayer play];
//    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)goToMainageFromRanking:(id)sender {
    
    NSString *storyBoardId = @"mainViewControllerId";
    
    ViewController *mainVC =
    [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
    [self.navigationController pushViewController:mainVC  animated:YES];
}


@end
