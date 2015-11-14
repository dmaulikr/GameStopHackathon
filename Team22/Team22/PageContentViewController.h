//
//  PageViewController.h
//  
//
//  Created by Manav Pavitra Singh on 11/14/15.
//
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property NSUInteger pageIndex;

@property NSString *imageFile;
@end
