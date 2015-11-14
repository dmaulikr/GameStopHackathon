//
//  ResultsViewController.h
//  Team22
//
//  Created by Manav Pavitra Singh on 11/14/15.
//  Copyright (c) 2015 SJSU. All rights reserved.
//

#import <UIKit/UIKit.h>

@import MediaPlayer;

@interface ResultsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong) MPMoviePlayerController* moviePlayerController;
@property (strong, nonatomic) IBOutlet UITableView *userTableView;

@property (strong, nonatomic) NSArray *usernamesArray;
@property (strong, nonatomic) NSArray *userReputationArray;

@property (strong, nonatomic) NSString *gameName;
@property (strong, nonatomic) NSString *gamePrice;

@property (weak, nonatomic) IBOutlet UILabel *gameNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *gamePriceLabel;
@end
