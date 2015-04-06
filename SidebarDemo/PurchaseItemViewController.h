//
//  PurchaseItemViewController.h
//  MaiaMall
//
//  Created by Ingrid Funie on 06/04/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALAlertBanner/ALAlertBanner.h"
#import "MMDDataBase.h"
#import "MMDItem.h"
#import "MMDCart.h"
#import "DefineKeys.h"
#import "PurchaseItemTableViewCell.h"


@interface PurchaseItemViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UITabBarDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *cartTV;
@property (strong, nonatomic) IBOutlet UILabel *basketSubtotalPrice;

@property (strong, nonatomic) IBOutlet UILabel *messageLabel;

@property (weak, nonatomic) IBOutlet UITabBar *tabBarController;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *filterSearchMenu;
@property(strong, nonatomic) IBOutlet UISearchBar *searchBar;

- (IBAction)plusButtonClicked:(UIButton *)sender;
- (IBAction)minusButtonClicked:(UIButton *)sender;
- (IBAction)purchaseButtonClicked:(UIButton *)sender;

@end
