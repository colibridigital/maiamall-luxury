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
#import "FilterMenuController.h"

@interface ProductListViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate, UISearchBarDelegate, UITabBarControllerDelegate, UITabBarDelegate, WYPopoverControllerDelegate> {
    WYPopoverController *anotherPopoverController;
    //FilterMenuController *filterMenuController;

}
@property (weak, nonatomic) IBOutlet UITabBar *tabBarController;
@property (weak, nonatomic) IBOutlet ProductListCollectionView *prodListCollectionView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property(strong, nonatomic) IBOutlet UISearchBar *searchBar;

- (void)initWithArrayWithSearchResults:(NSMutableArray*)array andTextForSearch:(NSString*)searchText;


@end
