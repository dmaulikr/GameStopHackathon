//
//  UserTableViewCell.h
//  Team22
//
//  Created by BYOUNGJUN JO on 11/14/15.
//  Copyright (c) 2015 SJSU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userReputation;

@property (weak, nonatomic) IBOutlet UIButton *followUserButton;
@end
