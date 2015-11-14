//
//  ResultsViewController.h
//  Team22
//
//  Created by Manav Pavitra Singh on 11/14/15.
//  Copyright (c) 2015 SJSU. All rights reserved.
//

#import <UIKit/UIKit.h>

@import MediaPlayer;

@interface ResultsViewController : UIViewController

@property(nonatomic, strong) MPMoviePlayerController* moviePlayerController;
@property (strong, nonatomic) IBOutlet UITableView *resultsTableView;

@end
