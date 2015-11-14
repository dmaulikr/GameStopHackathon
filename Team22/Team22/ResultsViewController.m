//
//  ResultsViewController.m
//  Team22
//
//  Created by Manav Pavitra Singh on 11/14/15.
//  Copyright (c) 2015 SJSU. All rights reserved.
//

#import "ResultsViewController.h"
#import "UserTableViewCell.h"

@interface ResultsViewController () <UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong)UIButton *button ;
@end

@implementation ResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.gameNameLabel.text = self.gameName;
    self.gamePriceLabel.text = [NSString stringWithFormat:@"Price: $%@",self.gamePrice];
    
    
    
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"videoplayback" ofType:@"mp4"];
    NSURL *fileURL = [NSURL fileURLWithPath:filepath];
   
    self.moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
   
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(introMovieFinished:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:self.moviePlayerController];
    
    // Hide the video controls from the user
    [self.moviePlayerController setControlStyle:MPMovieControlStyleNone];
    
  
    [self.moviePlayerController.view setFrame: CGRectMake(0, 0, 400, 200)];
     [self.view addSubview:self.moviePlayerController.view];
    
   self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button addTarget:self
               action:@selector(play:)
     forControlEvents:UIControlEventTouchUpInside];
    [self.button setTitle:@"Play" forState:UIControlStateNormal];
  
    self.button.frame = CGRectMake(170.0, 80.0, 30.0, 30.0);
    
    UIImage *btnImage = [UIImage imageNamed:@"1.png"];
    [self.button setImage:btnImage forState:UIControlStateNormal];
    [self.moviePlayerController.view addSubview:self.button];
    
    self.usernamesArray = [NSArray arrayWithObjects:@"Rand al'Thor", @"Matt Cauthon", @"Perrin Aybara", @"Eric Schindler", @"James Logan", @"Steve Rogers", @"Jason Todd", @"Tim Drake", @"Dick Grayson", @"Wally West", nil];
    self.userReputationArray = [NSArray arrayWithObjects:@"2312", @"2254", @"2001", @"1974", @"1900", @"1832", @"1755", @"1643", @"1343", @"1145", nil];
    
    [self.userTableView reloadData];
}

- (void)introMovieFinished:(NSNotification *)notification
{
    
    self.button.hidden = NO;
  
}

-(void)play:(UIButton*)button
{
    self.button.hidden = YES;
      //[self.moviePlayerController prepareToPlay];
     [self.moviePlayerController play];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.usernamesArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 67;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *userTableViewCellIdentifier = @"UserTableViewCell";
    
    UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:userTableViewCellIdentifier];
    
    if (cell == nil) {
        cell = [[UserTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:userTableViewCellIdentifier];
    }
    
    cell.userName.text = [self.usernamesArray objectAtIndex:indexPath.row];
    cell.userReputation.text = [self.userReputationArray objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}


@end
