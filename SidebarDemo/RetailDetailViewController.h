//
//  RetailDetailViewController.h
//  MaiaMall
//
//  Created by Ingrid Funie on 27/03/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMDStore.h"

@interface RetailDetailViewController : UIViewController<UIGestureRecognizerDelegate, UITabBarControllerDelegate, UITabBarDelegate>
@property (weak, nonatomic) IBOutlet UITabBar *tabBarController;
@property (strong, nonatomic) IBOutlet UILabel *brandTitle;
@property (strong, nonatomic) IBOutlet UITextView *brandDescription;
@property (strong, nonatomic) IBOutlet UIImageView *brandImage;

- (void)initWithStore:(MMDStore*)store;

@end