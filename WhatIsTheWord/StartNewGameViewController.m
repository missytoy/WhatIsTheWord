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
#import <SystemConfiguration/SystemConfiguration.h>
#import "Reachability.h"

#import "WhatIsTheWord-Swift.h"

CLLocationManager *locationManager;
CLLocation* location;
bool switchIsOn;
bool tookPlace;

@interface StartNewGameViewController () <CLLocationManagerDelegate>


@end

@implementation StartNewGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.soundPlayer= [[KKMusicPlayer alloc]init];
    [self.soundPlayer playSound:@"letitbegin"];
    
    self.title = @"";
    tookPlace = NO;
    switchIsOn = YES;
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"blankbackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.navigationController.navigationBar.barTintColor = [UIColor purpleColor];
    
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
      
    } else {
        switchIsOn = NO;
        
    }
}

- (IBAction)onChooseCategoryClick:(id)sender {
    
    [self.soundPlayer playSound:@"btnSound"];
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
            
            Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
            NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
            if (networkStatus == NotReachable) {
                NSString *storyBoardId = @"categoriesViewControllerId";
                
                CategoriesViewController *categoriesVC =
                [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
                categoriesVC.players = self.players;
                categoriesVC.locationForGame= nil;
                [self.navigationController pushViewController:categoriesVC animated:YES];
                
            } else {
                NSLog(@"There IS internet connection");
                
                locationManager = [[CLLocationManager alloc]init];
                locationManager.desiredAccuracy = kCLLocationAccuracyBest;
                locationManager.delegate = self;
                locationManager.distanceFilter = kCLLocationAccuracyHundredMeters;
                [locationManager requestAlwaysAuthorization];
                [locationManager startUpdatingLocation];
            }
            
            
        }else{
            NSString *storyBoardId = @"categoriesViewControllerId";
            
            CategoriesViewController *categoriesVC =
            [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
            categoriesVC.players = self.players;
            categoriesVC.locationForGame = nil;
            [self.navigationController pushViewController:categoriesVC animated:YES];
        }
    }
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations	{
    location = [locations lastObject];
    
    double log = location.coordinate.longitude;
    double lat = location.coordinate.latitude;
    if (tookPlace == NO) {
        [self getGoogleAdrressFromLatLong:lat lon:log];
        tookPlace = YES;
    }
    //        CLGeocoder *ceo = [[CLGeocoder alloc]init];
    //
    //        [ceo reverseGeocodeLocation:location
    //                  completionHandler:^(NSArray *placemarks, NSError *error) {
    //
    //                      CLPlacemark *placemark = [placemarks objectAtIndex:0];
    //
    //                      NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
    //
    //                      NSLog(@"I am currently at %@",locatedAt);
    //
    //                    if (tookPlace == NO) {
    //
    //                      //  [self getGoogleAdrressFromLatLong:42.650851 lon:23.377242];
    ////                      NSString *storyBoardId = @"categoriesViewControllerId";
    ////
    ////
    ////
    ////
    ////                      CategoriesViewController *categoriesVC =
    ////                      [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
    ////                      categoriesVC.players = self.players;
    ////                      categoriesVC.locationForGame = locatedAt;
    ////                      [locationManager stopUpdatingLocation];
    ////                        tookPlace = YES;
    ////                        [self.navigationController pushViewController:categoriesVC animated:YES];
    //                    }
    //                  }];
    
    
    
}

- (IBAction)addPlayerButton:(id)sender {
    
    [self.soundPlayer playSound:@"btnSound"];
    if(self.addPlayerNameField.text.length > 10 ){
        
        UIAlertController * alert=   [UIAlertController                                  alertControllerWithTitle:@"Name Error"                                                                                                          message:@"Player's name must be less than 11"                                                                                                   preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* yesButton = [UIAlertAction
                                    actionWithTitle:@"OK"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action)
                                    {
                                        //Handel Yes action
                                        
                                        
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
        
        
        KKPlayerSwift *playerSwift = [[KKPlayerSwift alloc] init];
        [playerSwift setValue:self.addPlayerNameField.text forKey:@"playerName"];
        
        NSString *playerToAdd = [NSString stringWithFormat:@"%@ \n%@",
                                 self.allPlayersTextView.text,self.addPlayerNameField.text];
        self.allPlayersTextView.text =playerToAdd;
        
        [self.players insertObject:playerSwift atIndex:0 ];
        self.addPlayerNameField.text = @"";
        
    }
}


-(void)getGoogleAdrressFromLatLong : (CGFloat)lat lon:(CGFloat)lon{
    //[self showLoadingView:@"Loading.."];
    
    NSError *error = nil;
    
    NSString *lookUpString  = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/geocode/json?latlng=%f,%f&key=AIzaSyB6DUf9Jr8CHXH9YzA-U3wj5pykZ8_gdQw", lat,lon];
    
    
    lookUpString = [lookUpString stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    NSData *jsonResponse = [NSData dataWithContentsOfURL:[NSURL URLWithString:lookUpString]];
    
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonResponse options:kNilOptions error:&error];
    
//  NSLog(@"%@",jsonDict);
    
    NSArray* jsonResults = [jsonDict objectForKey:@"results"];
//    NSLog(@"novo %@",jsonResults[0]);
//    
//    NSLog(@"novo %@",[jsonResults[0] objectForKey:@"formatted_address"]);
    
    NSString *storyBoardId = @"categoriesViewControllerId";
    CategoriesViewController *categoriesVC =
    [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
    categoriesVC.players = self.players;
    categoriesVC.locationForGame = [jsonResults[0] objectForKey:@"formatted_address"];
    [locationManager stopUpdatingLocation];
    tookPlace = YES;
    [self.navigationController pushViewController:categoriesVC animated:YES];
    
}

@end
