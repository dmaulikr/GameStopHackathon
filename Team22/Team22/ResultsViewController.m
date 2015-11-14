//
//  ResultsViewController.m
//  Team22
//
//  Created by Manav Pavitra Singh on 11/14/15.
//  Copyright (c) 2015 SJSU. All rights reserved.
//

#import "ResultsViewController.h"

@interface ResultsViewController () <UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong)UIButton *button ;
@end

@implementation ResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.resultsTableView.delegate = self;
    self.resultsTableView.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
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

#pragma mark - table View DataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
