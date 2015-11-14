//
//  LatestReleasesController.h
//  Team22
//
//  Created by BYOUNGJUN JO on 11/14/15.
//  Copyright (c) 2015 SJSU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LatestReleasesController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *latestReleasesTable;
@property (strong, nonatomic) NSArray *latestRelasesArray;
@property (strong, nonatomic) NSString *gameName;
@property (strong, nonatomic) NSString *gamePrice;

@end
