//
//  ViewController.h
//  Team22
//
//  Created by Manav Pavitra Singh on 11/14/15.
//  Copyright (c) 2015 SJSU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate, UISearchBarDelegate>

//@property(nonatomic, strong) UIDatePicker* myDatePicker;
@property(nonatomic, strong) UIPickerView *myPickerView;
@property(nonatomic, strong) NSArray *pickerArray;
@property (nonatomic, strong) IBOutlet UISearchBar *searchBar;
@property(strong, nonatomic, readwrite) UIView *inputView;
- (IBAction)mostPopularButton:(UIButton *)sender;
- (IBAction)latestGamesButton:(UIButton *)sender;
- (IBAction)genreButton:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

