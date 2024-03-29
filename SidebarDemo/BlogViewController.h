//
//  BlogViewController.h
//  MaiaMall
//
//  Created by Ingrid Funie on 27/03/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlogViewController : UIViewController<UIGestureRecognizerDelegate, UISearchBarDelegate, UITabBarControllerDelegate, UITabBarDelegate>
@property (weak, nonatomic) IBOutlet UITabBar *tabBarController;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *filterSearchMenu;
@property(strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong, nonatomic) IBOutlet UITextView *firstBlogPage;
@property (strong, nonatomic) IBOutlet UITextView *secondBlogPage;
@property (strong, nonatomic) IBOutlet UITextView *thirdBlogPage;

@property (strong, nonatomic) IBOutlet UIImageView *profileImage;
@property (strong, nonatomic) IBOutlet UIButton *folllowButton;
@property (strong, nonatomic) IBOutlet NSMutableArray *arrayWithSearchResults;
@end