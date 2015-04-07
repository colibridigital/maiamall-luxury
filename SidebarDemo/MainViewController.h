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
#import "AppDelegate.h"
#import "WYPopoverController.h"
#import "WYStoryboardPopoverSegue.h"
#import "MMDDataBase.h"
#import "MMDItem.h"
#import "SettingsViewController.h"
#import "FilterMenuController.h"

@interface MainViewController : UIViewController<UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate, UITabBarControllerDelegate, UITabBarDelegate, WYPopoverControllerDelegate, GenderWasChanged>
 {
    
    WYPopoverController *anotherPopoverController;
    SettingsViewController *settingsViewController;
    
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet TrendCollectionView *trendCollectionView;
@property (weak, nonatomic) IBOutlet ProductCollectionView *productCollectionView;
@property (strong, nonatomic) IBOutlet AppDelegate *appDelegate;

@property(strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property (weak, nonatomic) IBOutlet UITabBar *tabBarController;

@property (strong, nonatomic) NSMutableArray * arrayWithRecommendedItems;

-(void)cancelPopover:(WYPopoverController*)controller;

@end
