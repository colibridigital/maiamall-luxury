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
#import "AppDelegate.h"
#import "WYPopoverController.h"
#import "WYStoryboardPopoverSegue.h"

@interface MainViewController : UIViewController<UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate, UITabBarControllerDelegate, UITabBarDelegate, NIDropDownDelegate, WYPopoverControllerDelegate>
 {
    
    WYPopoverController *anotherPopoverController;

    
    
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet TrendCollectionView *trendCollectionView;
@property (weak, nonatomic) IBOutlet ProductCollectionView *productCollectionView;
@property (strong, nonatomic) IBOutlet AppDelegate *appDelegate;

@property(strong, nonatomic) IBOutlet NIDropDown *dropDown;

@property(strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property (weak, nonatomic) IBOutlet UITabBar *tabBarController;

-(void)rel;

@end
