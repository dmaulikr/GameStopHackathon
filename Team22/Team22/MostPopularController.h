//
//  MostPopularController.h
//  Team22
//
//  Created by BYOUNGJUN JO on 11/14/15.
//  Copyright (c) 2015 SJSU. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MediaPlayer;

@interface MostPopularController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *userTableView;

@property (strong, nonatomic) NSArray *usernamesArray;
@property (strong, nonatomic) NSArray *userReputationArray;

@property (weak, nonatomic) IBOutlet UILabel *gameNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *gamePriceLabel;

@property(nonatomic, strong) MPMoviePlayerController* moviePlayerController;
@property (weak, nonatomic) IBOutlet UIView *playerContainer;

@property(nonatomic, strong)UIButton *button ;

@end
