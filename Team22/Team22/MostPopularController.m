//
//  MostPopularController.m
//  Team22
//
//  Created by BYOUNGJUN JO on 11/14/15.
//  Copyright (c) 2015 SJSU. All rights reserved.
//

#import "MostPopularController.h"
#import "UserTableViewCell.h"
#import <AFHTTPRequestOperationManager.h>

@interface MostPopularController ()

@end

@implementation MostPopularController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.usernamesArray = [NSArray arrayWithObjects:@"Rand al'Thor", @"Matt Cauthon", @"Perrin Aybara", @"Eric Schindler", @"James Logan", @"Steve Rogers", @"Jason Todd", @"Tim Drake", @"Dick Grayson", @"Wally West", nil];
    self.userReputationArray = [NSArray arrayWithObjects:@"2312", @"2254", @"2001", @"1974", @"1900", @"1832", @"1755", @"1643", @"1343", @"1145", nil];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://api.apim.ibmcloud.com/gamestop/prod/gamestop/Products/?search=fallout&numRecords=1&client_secret=J0iO8iW0sJ6dW0vB3oF7bJ1dX5lK8aJ5vE2xN7kK0fH0gY1sD3&client_id=a4e74f38-6771-4a8e-983e-ba135b4dd5cc" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"JSON: %@", ((NSDictionary *)[responseObject objectAtIndex:0])[@"DisplayName"]);
        self.gameNameLabel.text = ((NSDictionary *)[responseObject objectAtIndex:0])[@"DisplayName"];
        self.gamePriceLabel.text = [NSString stringWithFormat:@"Price: $%@", ((NSDictionary *)[responseObject objectAtIndex:0])[@"Price"]];
    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
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
    [self.playerContainer addSubview:self.moviePlayerController.view];
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button addTarget:self
                    action:@selector(play:)
          forControlEvents:UIControlEventTouchUpInside];
    [self.button setTitle:@"Play" forState:UIControlStateNormal];
    
    self.button.frame = CGRectMake(170.0, 80.0, 30.0, 30.0);
    
    UIImage *btnImage = [UIImage imageNamed:@"1.png"];
    [self.button setImage:btnImage forState:UIControlStateNormal];
    [self.moviePlayerController.view addSubview:self.button];
    self.userTableView.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return self.usernamesArray.count;
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
