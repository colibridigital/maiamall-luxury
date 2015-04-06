//
//  ListOfItemsInTheStoreTableViewController.h
//  MaiaMall
//
//  Created by Ingrid Funie on 06/04/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemsInTheStoreTableViewCell.h"
#import "ProductDetailViewController.h"

@interface ListOfItemsInTheStoreViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UITabBarDelegate, UITabBarControllerDelegate>
@property (weak, nonatomic) IBOutlet UITabBar *tabBarController;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *filterSearchMenu;

@property (strong, nonatomic) IBOutlet UILabel *storeTitle;
@property (strong, nonatomic) IBOutlet UITableView *itemsList;

- (void)initWithDict:(NSMutableDictionary*)dict;

@end
