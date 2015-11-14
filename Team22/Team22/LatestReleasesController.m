//
//  LatestReleasesController.m
//  Team22
//
//  Created by BYOUNGJUN JO on 11/14/15.
//  Copyright (c) 2015 SJSU. All rights reserved.
//

#import "LatestReleasesController.h"
#import <AFHTTPRequestOperationManager.h>
#import "LatestReleasesTableViewCell.h"
#import "ResultsViewController.h"

@implementation LatestReleasesController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://api.apim.ibmcloud.com/gamestop/prod/gamestop/Products/TopSellers?itemsPerPage=10&client_secret=J0iO8iW0sJ6dW0vB3oF7bJ1dX5lK8aJ5vE2xN7kK0fH0gY1sD3&client_id=a4e74f38-6771-4a8e-983e-ba135b4dd5cc" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"JSON: %@", [[responseObject objectAtIndex:0] class]);
        
        self.latestRelasesArray = responseObject;
        [self.latestReleasesTable reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.latestRelasesArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *userTableViewCellIdentifier = @"LatestReleasesTableViewCell";
    
    LatestReleasesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:userTableViewCellIdentifier];
    
    if (cell == nil) {
        cell = [[LatestReleasesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:userTableViewCellIdentifier];
    }
    
    cell.gameName.text = ((NSDictionary *)[self.latestRelasesArray objectAtIndex:indexPath.row])[@"DisplayName"];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.gameName = ((NSDictionary *)[self.latestRelasesArray objectAtIndex:indexPath.row])[@"DisplayName"];
    self.gamePrice = ((NSDictionary *)[self.latestRelasesArray objectAtIndex:indexPath.row])[@"Price"];
    
    [self performSegueWithIdentifier:@"ToResultsViewController" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"ToResultsViewController"])
    {
        // Get reference to the destination view controller
        ResultsViewController *resultsViewController = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        resultsViewController.gameName = self.gameName;
        resultsViewController.gamePrice = self.gamePrice;
    }
}

@end
