//
//  ViewController.m
//  Team22
//
//  Created by Manav Pavitra Singh on 11/14/15.
//  Copyright (c) 2015 SJSU. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
    [self addPickerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addPickerView{
    self.pickerArray = [[NSArray alloc]initWithObjects: @"95113",
                   @"95444", @"94102", @"94120", @"94131", @"94164", @"94110", @"93257", @"93265", @"93267", nil];
   // myTextField = [[UITextField alloc]initWithFrame:
    //               CGRectMake(10, 100, 300, 30)];
   // myTextField.borderStyle = UITextBorderStyleRoundedRect;
   // myTextField.textAlignment = UITextAlignmentCenter;
   // myTextField.delegate = self;
    //[self.view addSubview:myTextField];
    //[myTextField setPlaceholder:@"Pick a Sport"];
    
    self.searchBar.delegate = self;
//    UIToolbar *toolBar= [[UIToolbar alloc] initWithFrame:CGRectMake(0,0,320,44)];
//    [toolBar setBarStyle:UIBarStyleBlackOpaque];
//    UIBarButtonItem *barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done"
//                                                                      style:UIBarButtonItemStyleBordered target:self action:@selector(changeDateFromLabel:)];
//    toolBar.items = @[barButtonDone];
//    barButtonDone.tintColor=[UIColor blackColor];
//    [pickerView addSubview:toolBar];
    
    self.myPickerView = [[UIPickerView alloc]init];
    self.myPickerView.frame = CGRectMake(0, 450, self.myPickerView.frame.size.width, self.myPickerView.frame.size.height);
    self.myPickerView.dataSource = self;
    self.myPickerView.delegate = self;
    self.myPickerView.showsSelectionIndicator = YES;
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    [toolBar setBarStyle:UIBarStyleBlackOpaque];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Done" style:UIBarButtonItemStyleDone
                                   target:self action:@selector(done:)];
    
        toolBar.items = @[doneButton];
        doneButton.tintColor=[UIColor blackColor];
        [self.myPickerView addSubview:toolBar];

    NSArray *toolbarItems = [NSArray arrayWithObjects:
                             doneButton, nil];
    [toolBar setItems:toolbarItems];

  //self.searchBar.inputView = self.myPickerView;
    self.searchBar.inputAccessoryView = self.myPickerView;
    
}
-(void)done:doneButton
{
     //NSInteger row = [self.myPickerView selectedRowInComponent:0];
    //if ( [self.myPickerView isFirstResponder] ) {
      //  NSLog(@"%@", [listOfLocations objectAtIndex:row]);
        [self.searchBar resignFirstResponder];
    //}
}


- (IBAction)mostPopularButton:(UIButton *)sender {
}

- (IBAction)latestGamesButton:(UIButton *)sender {
}

- (IBAction)genreButton:(UIButton *)sender {
}

#pragma mark - Text field delegates

//-(void)textFieldDidBeginEditing:(UITextField *)textField{
//    if ([textField.text isEqualToString:@""]) {
//        [self dateChanged:nil];
//    }
//}
#pragma mark - Picker View Data source
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component{
    return [self.pickerArray count];
}

#pragma mark- Picker View Delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:
(NSInteger)row inComponent:(NSInteger)component{
    [self.searchBar setText:[self.pickerArray objectAtIndex:row]];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:
(NSInteger)row forComponent:(NSInteger)component{
    return [self.pickerArray objectAtIndex:row];
}

-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.50];
    [UIView setAnimationDelegate:self];
    self.myPickerView.frame = CGRectMake(0, 450, self.myPickerView.frame.size.width, self.myPickerView.frame.size.height);

    self.myPickerView.backgroundColor =     [UIColor colorWithRed:0.071f green:0.212f blue:0.333f alpha:1.00f];
    
    [self.view addSubview:self.myPickerView];
    [UIView commitAnimations];
    return NO;
}

//- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//    NSAttributedString *attString;
////    NSString *title = [[self.pickerArray valueForKey:@"description"] componentsJoinedByString:@""];
//    int i=0;
//    while (i<10) {
//        NSString *title = [self.pickerArray objectAtIndex:i];
//        attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
//        
//        return attString;
//        i++;
//       
//    }
//    return attString;
//    
//}

@end
