//
//  HistoryViewController.m
//  WhatIsTheWord
//
//  Created by Konstantina on 1/28/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import "HistoryViewController.h"
#import "ViewController.h"
#import "Game.h"
#import "Player.h"
#import "KKCoreDataHelper.h"
//#import "KKCategoryTableViewCell.h"

@interface HistoryViewController()
@property (strong,nonatomic) KKCoreDataHelper* dbHelper;

@end

NSArray* allGames;
NSDateFormatter *formatter;

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.soundPlayer= [[KKMusicPlayer alloc]init];
    [self.soundPlayer playSound:@"Flickingbook"];
    
    self.title = @"History";
    [self fetchData];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"history.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    self.backToHistoryButton.hidden=YES;
    self.imageGame.hidden = YES;
    self.detailInfoForSelectedGame.hidden = YES;
    
    self.historyInfoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.historyInfoTableView.dataSource = self;
    self.historyInfoTableView.delegate=self;
    
    
    formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat : @"dd.MM.yy HH:mm"];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath   {
    
    static NSString *cellIdentifier = @"newCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell ==nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    Game *game = (Game*)allGames[indexPath.row] ;
    
    
    NSString *dateTime = [formatter stringFromDate:[game datePlayedOn]];
    
    cell.textLabel.text =[NSString stringWithFormat:@"%@ / %@",
                          [game categoryName],
                          dateTime] ;
    
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    
    cell.textLabel.font = [ UIFont fontWithName: @"Papyrus" size: 20.0 ];
    cell.textLabel.textColor =[ UIColor purpleColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    [cell setBackgroundColor:[UIColor clearColor]];
    [self.historyInfoTableView setBackgroundColor:[UIColor clearColor] ];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section  {
    return  allGames.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath {
    
    NSString *playersString=@"";
    [self.soundPlayer playSound:@"Flickingbook"];
   // int counter= 1;
    Game *selectedGame = (Game*)allGames[indexPath.row] ;
    
    NSMutableArray* allPlayers = [[NSMutableArray alloc]init];
    
    for (Player* pl in [selectedGame players]) {
  
        [allPlayers addObject:pl];
    }
    
    
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"score"
                                                 ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray = [allPlayers sortedArrayUsingDescriptors:sortDescriptors];
    
    int counter = 1;
    for (Player *player in sortedArray) {
        
        NSString* currentPlayerInfo = [NSString stringWithFormat:@"\n%d. %@ (%@ score)",counter++,player.playerName,player.score];
        
        playersString  = [NSString stringWithFormat:@" %@ %@",playersString,currentPlayerInfo];
    }
    
    NSString* catName = [selectedGame categoryName];
    NSString* currentlocation = [selectedGame location];
    NSData* img = [selectedGame image];
    NSDate* date =  [selectedGame datePlayedOn];
    NSString *dateTime = [formatter stringFromDate:date];
    
    self.detailInfoForSelectedGame.text=
    [NSString stringWithFormat:@"    - Players:%@ \n    -  Category: %@\n    - Played on: %@\n    - Place: %@",
     playersString,catName , dateTime ,currentlocation];
    if (img == nil) {
        self.imageGame.image = [UIImage imageNamed:@"snimka.png"];
    }else{
        self.imageGame.image = [UIImage imageWithData:img];
    }
    
    
    self.detailInfoForSelectedGame.textAlignment = NSTextAlignmentLeft;
    
    self.detailInfoForSelectedGame.font = [ UIFont fontWithName: @"Papyrus" size: 20.0 ];
    self.detailInfoForSelectedGame.textColor =[ UIColor purpleColor];
    
    [self.detailInfoForSelectedGame setBackgroundColor:[UIColor clearColor] ];
    
    [self showAndHide];
    
}

- (IBAction)backButton:(id)sender {
    //[self performSelectorOnMainThread:@selector(showAndHide) withObject:nil waitUntilDone:NO];
    [self.soundPlayer playSound:@"btnSound"];
    [self showAndHide];
}



- (IBAction)goToMainPageClicked:(id)sender {
    
    NSString *storyBoardId = @"mainViewControllerId";
    [self.soundPlayer playSound:@"btnSound"];
    ViewController *mainVC =
    [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
    [self.navigationController pushViewController:mainVC  animated:YES];
}


-(void)showAndHide
{
    if(self.backToHistoryButton.hidden == NO){
        
        self.backToHistoryButton.hidden = YES;
        self.goToMainPageFromHistory.hidden = NO;
        self.historyInfoTableView.hidden = NO;
        self.detailInfoForSelectedGame.hidden = YES;
        self.imageGame.hidden = YES;
    }else{
        self.backToHistoryButton.hidden = NO;
        self.goToMainPageFromHistory.hidden = YES;
        self.historyInfoTableView.hidden = YES;
        self.detailInfoForSelectedGame.hidden = NO;
        self.imageGame.hidden = NO;
    }
}


-(void)fetchData{
    
    self.dbHelper = [[KKCoreDataHelper alloc]init];
    [self.dbHelper setupCoreData];
    
    //zagrubenqk grubeshtastnik
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Game" ];
    NSSortDescriptor *sortDesriptor = [NSSortDescriptor sortDescriptorWithKey:@"datePlayedOn" ascending:NO];
    
    [request setSortDescriptors:[NSArray arrayWithObject:sortDesriptor] ];
    [request setFetchLimit:10];
    
    allGames = [self.dbHelper.context executeFetchRequest:request error:nil];
    
}
@end


//-(KKCategoryTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath   {
//
//    NSLog(@"%@ ",allGames[indexPath.row] );
//
//    static NSString *cellIdentifier = @"CategoryCellCustom";
//
//    KKCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    if (cell ==nil) {
//
//        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"KKCategoryTableViewCell" owner:self options:nil];
//
//        cell = [nibArray objectAtIndex:0];
//    }
//    NSLog(@"%@",[allGames[indexPath.row] categoryName]);
//
////    cell.nameCategory.text = [NSString stringWithFormat:@"%@",[allGames[indexPath.row] categoryName] ];
//
//      cell.nameCategory.text = @"maimunka bee";
//
//    UIImage *imageForGame;
//
//    if([allGames[indexPath.row] image]){
//        imageForGame= [UIImage imageNamed:[NSString stringWithFormat:@"%@",[allGames[indexPath.row] image] ]];
//    }else{
//
//        imageForGame = [UIImage imageNamed:@"snimka.png"];
//    }
//
//    imageForGame = [UIImage imageNamed:@"snimka.png"];// //
//    NSLog(@"%@ ",imageForGame);
//    [cell.imageCategory setImage:imageForGame];
//
////
////    cell.nameCategory.textAlignment = NSTextAlignmentCenter;
////    cell.nameCategory.font = [ UIFont fontWithName: @"Papyrus" size: 30.0 ];
////    cell.nameCategory.textColor =[ UIColor whiteColor];
////
////    [cell setBackgroundColor:[UIColor clearColor]];
////    [self.historyInfoTableView setBackgroundColor:[UIColor clearColor] ];
////
//    //[self.historyInfoTableView reloadData];
//    return cell;
//}
//








//    KKCategoryTableViewCell *imecne = (KKCategoryTableViewCell*) [tableView cellForRowAtIndexPath:indexPath];

//   NSLog(imecne.nameCategory.text);

//    -(KKCategoryTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath   {
//
//        static NSString *cellIdentifier = @"CategoryCellCustom";
//
//        KKCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//        if (cell ==nil) {
//
//            NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"KKCategoryTableViewCell" owner:self options:nil];
//
//            cell = [nibArray objectAtIndex:0];
//        }
//
//        cell.nameCategory.text = @"que pasa be";
//        cell.nameCategory.hidden= NO;
//        cell.textLabel.text = [allGames[indexPath.row] categoryName];
//        return cell;
//    }
