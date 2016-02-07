//
//  CameraaViewController.m
//  WhatIsTheWord
//
//  Created by Konstantina on 2/2/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import "CameraaViewController.h"
#import "RankingController.h"


@interface CameraaViewController ()

@end

AVCaptureSession *session;
AVCaptureStillImageOutput *StillImageOutput;
NSData *imageForRanking;

@implementation CameraaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"blankbackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];

}

-(void) viewWillAppear:(BOOL)animated{

    session = [[AVCaptureSession alloc]init];
    [session setSessionPreset:AVCaptureSessionPresetPhoto];
    
    AVCaptureDevice *inputDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error;
    AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:inputDevice error:&error];
    if ([session canAddInput:deviceInput]) {
        [session addInput:deviceInput];
    }
    
    AVCaptureVideoPreviewLayer *previewLayer = [[AVCaptureVideoPreviewLayer alloc]initWithSession:session];
    [previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    CALayer *rootLayer = [[self view] layer];
    [rootLayer setMasksToBounds:YES];
    CGRect frame = frameforcapture.frame;
    
    [previewLayer setFrame:frame];
    [rootLayer insertSublayer:previewLayer atIndex:0];
    
    StillImageOutput = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary *outputSettings = [[NSDictionary alloc]initWithObjectsAndKeys:AVVideoCodecJPEG, AVVideoCodecKey, nil];
    
    [StillImageOutput setOutputSettings:outputSettings];
    [session addOutput:StillImageOutput];
    [session startRunning];
    
}
- (IBAction)backToRankingPageBtnClick:(id)sender {
    
    
    NSString *storyBoardId = @"rankingControllerId";
    
    RankingController *rankingVC =
    [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
    rankingVC.players = self.players;
    rankingVC.imageForGame = imageForRanking;
    rankingVC.locationForGame = self.locationForGame;
    [self.navigationController pushViewController:rankingVC  animated:YES];
    
}

-(IBAction)takePhoto:(id)sender{
    AVCaptureConnection * videoConnection = nil;
    for(AVCaptureConnection *connection in StillImageOutput.connections ){
        for(AVCaptureInputPort * port in [connection inputPorts]){
            if ([[port mediaType] isEqual:AVMediaTypeVideo]) {
                videoConnection = connection;
                break;
            }
        }
    }

    
    @try {
        
        [StillImageOutput captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
            if (imageDataSampleBuffer !=NULL) {
                NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
                UIImage *image = [UIImage imageWithData:imageData];
                imageView.image = image;
                imageForRanking = UIImagePNGRepresentation(image);
            }
        }];
    }
    @catch (NSException *exception) {
        NSLog(@"On simulator can't take images");
        imageView.image = [UIImage imageNamed:@"snimka.png"];
        imageForRanking = nil;

    }
}

@end
