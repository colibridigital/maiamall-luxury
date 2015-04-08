//
//  ProfileViewController.m
//  MaiaMall
//
//  Created by Ingrid Funie on 20/03/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "ProfileViewController.h"
#import "SWRevealViewController.h"
#import "ProductCollectionViewCell.h"
#import "CollectionsCollectionViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import "ProductDetailViewController.h"
#import "CollectionListViewController.h"
#import "MapViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initialiseMenuItems];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:NO];
    
    [self initialiseMenuItems];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initialiseMenuItems
{
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(-5.0, 0.0, 320.0, 44.0)];
    self.searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    UIView *searchBarView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 310.0, 44.0)];
    searchBarView.autoresizingMask = 0;
    self.searchBar.delegate = self;
    //searchBar.backgroundImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MaiaMall-Logo-Light" ofType: @"jpg"]];
    self.searchBar.backgroundImage = [[UIImage alloc] init];
    
    
    [searchBarView addSubview:self.searchBar];
    self.navigationItem.titleView = searchBarView;
    
    self.folllowButton.layer.cornerRadius = 2;
    self.folllowButton.layer.borderWidth = 1;
    self.folllowButton.layer.borderColor = [UIColor whiteColor].CGColor;
    
    
    [self.favsCollectionView registerNibAndCell];
    [self.collsCollectionView registerNibAndCell];
    
    [self.favsCollectionView reloadData];
    [self.collsCollectionView reloadData];
    
    self.tabBarController.delegate = self;
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    if (item.tag == 0) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        
        UINavigationController *map = [storyboard instantiateViewControllerWithIdentifier:@"profileNav"];
        
        [self showViewController:map sender:self];
        
    } else if (item.tag == 1) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        
        UINavigationController *map = [storyboard instantiateViewControllerWithIdentifier:@"mapNav"];
        
        [self showViewController:map sender:self];
    } else if (item.tag == 2) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        
        UINavigationController *map = [storyboard instantiateViewControllerWithIdentifier:@"homeNav"];
        
        [self showViewController:map sender:self];
        // [item setEnabled:YES];
        
    } else if (item.tag == 3) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        
        UINavigationController *map = [storyboard instantiateViewControllerWithIdentifier:@"blogNav"];
        
        // [self performSegueWithIdentifier:@"mapNav" sender:self];
        
        [self showViewController:map sender:self];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView == self.collsCollectionView) {
        return 5;
    } else if (collectionView == self.favsCollectionView) {
        return 20;
    }
    
    else return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (collectionView == self.collsCollectionView) {
        CollectionsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"COLL_CELL" forIndexPath:indexPath];
        
        return cell;
    } else {
        ProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PROD_CELL" forIndexPath:indexPath];
        
        return cell;

    }
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (collectionView == self.favsCollectionView) {
    
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        
        ProductDetailViewController *prodDetail = [storyboard instantiateViewControllerWithIdentifier:@"prodDetailView"];
    
       // UINavigationController *det = [storyboard instantiateViewControllerWithIdentifier:@"detNav"];
    
        [self showViewController:prodDetail sender:self];
    } else if (collectionView == self.collsCollectionView){
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        
        CollectionListViewController *prod = [storyboard instantiateViewControllerWithIdentifier:@"collectionListView"];
        
        [self showViewController:prod sender:self];

    } 
    
}

- (IBAction)filterSearchMenuClicked:(id)sender {
    
    self.arrayWithSearchResults = [[NSMutableArray alloc] init];
    
    for (MMDItem* item in [[MMDDataBase database] arrayWithItems]) {
        if (![[NSUserDefaults standardUserDefaults] boolForKey:kFemaleOrMaleSwitch]) {
            if ([[item.itemTitle lowercaseString] rangeOfString:[self.searchBar.text lowercaseString]].location != NSNotFound && item.itemGender == female) {
                [self.arrayWithSearchResults addObject:item];
            }
        } else {
            if ([[item.itemTitle lowercaseString] rangeOfString:[self.searchBar.text lowercaseString]].location != NSNotFound) {
                [self.arrayWithSearchResults addObject:item];
            }
        }
        
    }
    
    if (self.searchBar.text != nil && self.arrayWithSearchResults.count > 0) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
            
            MapViewController *map = [storyboard instantiateViewControllerWithIdentifier:@"map"];
            
            [map initWithArrayWithSearchResults:self.arrayWithSearchResults andTextForSearch:self.searchBar.text];
            //[map initMap];
            
            [map populateMapWithData];
            
            [self.navigationController pushViewController:map animated:YES];
        });
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
            MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.mode = MBProgressHUDModeText;
            hud.labelText = @"No Results Found";
        });
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        });
    }
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
