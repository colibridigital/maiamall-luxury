//
//  ProductListViewController.h
//  MaiaMall
//
//  Created by Ingrid Funie on 18/03/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductListCollectionView.h"
#import "WYPopoverController.h"
#import "WYStoryboardPopoverSegue.h"
#import "MMDItem.h"


@interface ProductListViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate, UISearchBarDelegate, UITabBarControllerDelegate, UITabBarDelegate, WYPopoverControllerDelegate>

@property (weak, nonatomic) IBOutlet UITabBar *tabBarController;
@property (weak, nonatomic) IBOutlet ProductListCollectionView *prodListCollectionView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property(strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property(strong, nonatomic) WYPopoverController *anotherPopoverController;

- (void)initWithArrayWithSearchResults:(NSMutableArray*)array andTextForSearch:(NSString*)searchText;

-(void)cancelPopover:(WYPopoverController*)controller;

@end
