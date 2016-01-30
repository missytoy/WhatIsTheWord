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
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"ranking.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
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
