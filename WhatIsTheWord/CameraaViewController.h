//
//  CameraaViewController.h
//  WhatIsTheWord
//
//  Created by Konstantina on 2/2/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface CameraaViewController : UIViewController{
    IBOutlet UIView *frameforcapture;
    IBOutlet UIImageView *imageView;
}


//CORE
@property NSArray *players;
@property NSArray *scores;
@property NSData *image;


-(IBAction)takePhoto:(id)sender;

@end
