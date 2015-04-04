//
//  WishlistViewController.h
//  MaiaMall
//
//  Created by Ingrid Funie on 04/04/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WishlistViewController : UIViewController<UISearchBarDelegate, UITabBarDelegate, UITabBarControllerDelegate, UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITabBar *tabBarController;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *filterSearchMenu;
@property (strong, nonatomic) IBOutlet UITableView *wishlistItems;
@property(strong, nonatomic) IBOutlet UISearchBar *searchBar;
@end

