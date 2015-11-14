//
//  ViewController.h
//  Team22
//
//  Created by Manav Pavitra Singh on 11/14/15.
//  Copyright (c) 2015 SJSU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

- (IBAction)mostPopularButton:(UIButton *)sender;
- (IBAction)latestGamesButton:(UIButton *)sender;
- (IBAction)genreButton:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

