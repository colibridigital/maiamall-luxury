//
//  MapViewController.h
//  SidebarDemo
//
//  Created by Simon on 30/6/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "MMDItem.h"
#import <GoogleMaps/GoogleMaps.h>
#import "ListOfItemsInTheStoreViewController.h"

@interface MapViewController : UIViewController<UISearchBarDelegate, UITabBarDelegate, UITabBarControllerDelegate, CLLocationManagerDelegate, GMSMapViewDelegate>
@property (weak, nonatomic) IBOutlet UITabBar *tabBarController;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *filterSearchMenu;
@property(strong, nonatomic) IBOutlet UISearchBar *searchBar;


@property (strong, nonatomic) NSMutableArray * arrayWithSearchResults; //array of MMDItems
@property (strong, nonatomic) NSMutableArray * arrayWithSearchResultsBeforeFiltering;
@property (strong, nonatomic) NSString * searchText;

@property (strong, nonatomic)  NSMutableArray * arrayWithStoresWhichAlreadyOnTheMap;

- (void)initWithArrayWithSearchResults:(NSMutableArray*)array andTextForSearch:(NSString*)searchText;
- (void)populateMapWithData;

@end
