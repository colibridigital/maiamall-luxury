//
//  ProductListViewController.h
//  MaiaMall
//
//  Created by Ingrid Funie on 18/03/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductListCollectionView.h"

@interface ProductListViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet ProductListCollectionView *prodListCollectionView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *filterSearchMenu;
@property(strong, nonatomic) IBOutlet UISearchBar *searchBar;
@end
