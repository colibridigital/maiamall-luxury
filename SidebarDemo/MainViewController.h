//
//  ViewController.h
//  SidebarDemo
//
//  Created by Simon on 28/6/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrendCollectionView.h"
#import "ProductCollectionView.h"
#import "NIDropDown.h"

@interface MainViewController : UIViewController<UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate, NIDropDownDelegate, UITabBarControllerDelegate, UITabBarDelegate> {
    NIDropDown *dropDown;
}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet TrendCollectionView *trendCollectionView;
@property (weak, nonatomic) IBOutlet ProductCollectionView *productCollectionView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *filterSearchMenu;
- (IBAction)filterSearchMenuClicked:(id)sender;
@property(strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property (weak, nonatomic) IBOutlet UITabBar *tabBarController;

@end
