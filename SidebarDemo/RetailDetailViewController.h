//
//  RetailDetailViewController.h
//  MaiaMall
//
//  Created by Ingrid Funie on 27/03/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMDStore.h"
#import "ALAlertBanner.h"
#import "THDatePickerViewController.h"

@interface RetailDetailViewController : UIViewController<UIGestureRecognizerDelegate, UITabBarControllerDelegate, UITabBarDelegate, THDatePickerDelegate>
@property (weak, nonatomic) IBOutlet UITabBar *tabBarController;
@property (strong, nonatomic) IBOutlet UILabel *brandTitle;
@property (strong, nonatomic) IBOutlet UITextView *brandDescription;
@property (strong, nonatomic) IBOutlet UIImageView *brandImage;

- (void)initWithStore:(MMDStore*)store;
@property (nonatomic, strong) THDatePickerViewController * datePicker;

- (IBAction)bookAnApptClicked:(UIButton *)sender;
- (IBAction)offersClicked:(UIButton *)sender;

@end