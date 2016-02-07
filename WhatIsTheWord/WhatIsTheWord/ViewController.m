//
//  ViewController.m
//  WhatIsTheWord
//
//  Created by Konstantina on 1/24/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
     self.soundPlayer= [[KKMusicPlayer alloc]init];
    self.title = @"Main Page";
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"blankbackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
}
- (IBAction)startGameBtnOnClick:(id)sender {
     [self.soundPlayer playSound:@"btnSound"];
}

- (IBAction)onHstoryBtnClick:(id)sender {
     [self.soundPlayer playSound:@"btnSound"];
}


@end
