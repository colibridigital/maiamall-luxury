//
//  ProfileViewController.h
//  MaiaMall
//
//  Created by Ingrid Funie on 20/03/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController<UISearchBarDelegate, UITabBarControllerDelegate, UITabBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (strong, nonatomic) IBOutlet UITabBar *tabBarController;

@end
