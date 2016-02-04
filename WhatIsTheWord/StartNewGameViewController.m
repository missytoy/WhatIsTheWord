//
//  StartNewGameViewController.m
//  WhatIsTheWord
//
//  Created by Konstantina on 1/28/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import "StartNewGameViewController.h"
#import "CategoriesViewController.h"
#import <CoreLocation/CoreLocation.h>

CLLocationManager *locationManager;
id location;
bool switchIsOn;
bool tookPlace;

@interface StartNewGameViewController () <CLLocationManagerDelegate>


@end

@implementation StartNewGameViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"";
    tookPlace = NO;
    switchIsOn = YES;
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"blankbackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    [self.allPlayersTextView.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [self.allPlayersTextView.layer setBorderWidth:2.0];
    self.allPlayersTextView.layer.cornerRadius = 10;
    self.allPlayersTextView.clipsToBounds = YES;
    self.players = [[NSMutableArray alloc]init];
    
    
}
- (IBAction)onTakePlaceSwitch:(id)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    if ([mySwitch isOn]) {
        switchIsOn = YES;
        NSLog(@"its on!");
    } else {
        switchIsOn = NO;
        NSLog(@"its off!");
    }
}

- (IBAction)onChooseCategoryClick:(id)sender {
    
    if(self.players.count<2){
        UIAlertController * alert=   [UIAlertController                                  alertControllerWithTitle:@"At least two players"                                                                                                          message:@"You should have at least two players to play the game"                                                                                                   preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* yesButton = [UIAlertAction
                                    actionWithTitle:@"OK"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action)
                                    {
                                        //Handel your yes please button action here
                                        
                                        
                                    }];
        
        [alert addAction:yesButton];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
    
    if(switchIsOn){
        locationManager = [[CLLocationManager alloc]init];
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.delegate = self;
        locationManager.distanceFilter = kCLLocationAccuracyHundredMeters;
        [locationManager requestAlwaysAuthorization];
        [locationManager startUpdatingLocation];
        
        
    }else{
        NSString *storyBoardId = @"categoriesViewControllerId";
        
        CategoriesViewController *categoriesVC =
        [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
        categoriesVC.players = self.players;
        categoriesVC.location = nil;
        [self.navigationController pushViewController:categoriesVC animated:YES];
    }
}
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations	{
    location = [locations lastObject];
    
    
        CLGeocoder *ceo = [[CLGeocoder alloc]init];
        
        [ceo reverseGeocodeLocation:location
                  completionHandler:^(NSArray *placemarks, NSError *error) {
                      
                      CLPlacemark *placemark = [placemarks objectAtIndex:0];
                      
                      NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
                      
                      NSLog(@"I am currently at %@",locatedAt);
                      
                    if (tookPlace == NO) {
                      NSString *storyBoardId = @"categoriesViewControllerId";
                      
                      CategoriesViewController *categoriesVC =
                      [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
                      categoriesVC.players = self.players;
                      categoriesVC.location = locatedAt;
                      [locationManager stopUpdatingLocation];
                        tookPlace = YES;
                        [self.navigationController pushViewController:categoriesVC animated:YES];
                    }
                  }];
        
    
    
    }

- (IBAction)addPlayerButton:(id)sender {
    
    if(self.addPlayerNameField.text.length > 10 ){
        
        UIAlertController * alert=   [UIAlertController                                  alertControllerWithTitle:@"Name Error"                                                                                                          message:@"Player's name must be less than 11"                                                                                                   preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* yesButton = [UIAlertAction
                                    actionWithTitle:@"OK"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action)
                                    {
                                        //Handel your yes please button action here
                                        
                                        
                                    }];
        
        [alert addAction:yesButton];
        [self presentViewController:alert animated:YES completion:nil];
        
        
        self.addPlayerNameField.text = @"";
    }else if(self.addPlayerNameField.text.length <1){
        
        UIAlertController * alert=   [UIAlertController                                  alertControllerWithTitle:@"Name Error"
           message:@"Player's name can't be empty"preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* yesButton = [UIAlertAction
                                    actionWithTitle:@"OK"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action)
                                    {
                                        //Handel your yes please button action here
                                        
                                        
                                    }];
        
        [alert addAction:yesButton];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        
        NSString *playerToAdd = [NSString stringWithFormat:@"%@ \n%@",
                                 self.allPlayersTextView.text,self.addPlayerNameField.text];
        self.allPlayersTextView.text =playerToAdd;
        
        [self.players insertObject:self.addPlayerNameField.text atIndex:0 ];
             self.addPlayerNameField.text = @"";
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
