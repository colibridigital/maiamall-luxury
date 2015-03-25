//
//  ProductDetailViewController.h
//  MaiaMall
//
//  Created by Ingrid Funie on 19/03/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemsSimilarCollectionView.h"

@interface ProductDetailViewController : UIViewController<UISearchBarDelegate, UITabBarDelegate, UITabBarControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet ItemsSimilarCollectionView *similarItemsList;

@property (weak, nonatomic) IBOutlet UITabBar *tabBarController;
@property (weak, nonatomic) IBOutlet UILabel *productTitle;
@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *productPrice;
@property (weak, nonatomic) IBOutlet UITextView *productDescription;
@property (weak, nonatomic) IBOutlet UIButton *retailPageButton;
@property (weak, nonatomic) IBOutlet UIButton *buyThisButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *filterSearchMenu;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@end
