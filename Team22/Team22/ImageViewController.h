//
//  ImageViewController.h
//  Team22
//
//  Created by Manav Pavitra Singh on 11/14/15.
//  Copyright (c) 2015 SJSU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UIPageViewController


@property (strong, nonatomic) NSArray *pageImages;

@property (strong, nonatomic) NSTimer *imageTimer;

@end
