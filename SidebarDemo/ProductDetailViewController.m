//
//  ProductDetailViewController.m
//  MaiaMall
//
//  Created by Ingrid Funie on 19/03/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "SWRevealViewController.h"
#import "ItemsSimilarCollectionViewCell.h"
#import "RetailDetailViewController.h"
#import "MMDWishList.h"

@interface ProductDetailViewController ()
@property (strong, nonatomic) MMDItem * currentItemToShow;

@property (strong, nonatomic) NSMutableArray * arrayWithRecommendedItems;

@end

@implementation ProductDetailViewController


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initWithItem:(MMDItem*)item {
    self.currentItemToShow = item;
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
    
    self.tabBarController.delegate =self;
    
    [self.similarItemsList registerNibAndCell];
    [self.similarItemsList reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.arrayWithRecommendedItems = [[NSMutableArray alloc] init];
    
    [self initialiseMenuItems];
    
    [self getRecommendedItems];

}

- (void)getRecommendedItems {
    dispatch_async(dispatch_queue_create("Reccommendations", nil), ^{
        NSMutableArray * tempArray = [[NSMutableArray alloc] init];
        
        for (MMDItem * item in [[MMDDataBase database] arrayWithItems]) {
           if (item.itemGender == female && [item.itemCategory isEqualToString:self.currentItemToShow.itemCategory]) {
                [tempArray addObject:item];
            }
        }
        
        if (tempArray.count > 0) {
            [self.arrayWithRecommendedItems removeAllObjects];
            for (int i = 0; i < (tempArray.count > 10 ? 10 : tempArray.count); i++) {
                int index = arc4random() % tempArray.count;
                [self.arrayWithRecommendedItems addObject:[tempArray objectAtIndex:index]];
                [tempArray removeObjectAtIndex:index];
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.similarItemsList reloadData];
        });
        
    });
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"product info %@", self.currentItemToShow.itemTitle);
    
    self.productTitle.text = [NSString stringWithFormat:@"%@", self.currentItemToShow.itemTitle ? self.currentItemToShow.itemTitle : @"N/A"];
    self.productPrice.text = [NSString stringWithFormat:@"£%.2f", self.currentItemToShow.itemPrice];
    self.productDescription.text = self.currentItemToShow.itemDescription;
    [self.productImage setImage:self.currentItemToShow.itemImage];
    [self.retailPageButton setTitle:self.currentItemToShow.itemStore.storeTitle forState:UIControlStateNormal];
    
    [self initialiseMenuItems];

}


-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    if (item.tag == 0) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        
        UINavigationController *map = [storyboard instantiateViewControllerWithIdentifier:@"profileNav"];
        
        [self showViewController:map sender:self];
        
    } else if (item.tag == 1) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        
        UINavigationController *map = [storyboard instantiateViewControllerWithIdentifier:@"mapNav"];
        
        // [self performSegueWithIdentifier:@"mapNav" sender:self];
        
        [self showViewController:map sender:self];
    } else if (item.tag == 2) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        
        UINavigationController *map = [storyboard instantiateViewControllerWithIdentifier:@"homeNav"];
        
        // [self performSegueWithIdentifier:@"mapNav" sender:self];
        
        [self showViewController:map sender:self];
    } else if (item.tag == 3) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        
        UINavigationController *map = [storyboard instantiateViewControllerWithIdentifier:@"blogNav"];
        
        // [self performSegueWithIdentifier:@"mapNav" sender:self];
        
        [self showViewController:map sender:self];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.arrayWithRecommendedItems.count > 0) {
        return 7;
    } else {
        return 0;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ItemsSimilarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ISIM_CELL" forIndexPath:indexPath];
    
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] init];
    if (((MMDItem*)[self.arrayWithRecommendedItems objectAtIndex:indexPath.row]).itemImage != nil) {
        [dict setObject:((MMDItem*)[self.arrayWithRecommendedItems objectAtIndex:indexPath.row]).itemImage forKey:kItemImage];
    }
    if (((MMDItem*)[self.arrayWithRecommendedItems objectAtIndex:indexPath.row]).itemBrand.brandImage != nil) {
        [dict setObject:((MMDItem*)[self.arrayWithRecommendedItems objectAtIndex:indexPath.row]).itemBrand.brandImage forKey:kBrandImage];
    }
    if (((MMDItem*)[self.arrayWithRecommendedItems objectAtIndex:indexPath.row]).itemStore.storeLogo != nil) {
        [dict setObject:((MMDItem*)[self.arrayWithRecommendedItems objectAtIndex:indexPath.row]).itemStore.storeLogo forKey:kStoreLogo];
    }
    [dict setObject:@"2 mi away" forKey:@"distance"];
    
    NSLog(@"in the prodDetail cell");
    
    [cell initWithDictionary:dict];
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        
        //  UINavigationController *det = [storyboard instantiateViewControllerWithIdentifier:@"detNav"];
        
        ProductDetailViewController *prodDetail = [storyboard instantiateViewControllerWithIdentifier:@"prodDetailView"];
        
        MMDItem* item = [self.arrayWithRecommendedItems objectAtIndex:indexPath.row];
        
        [prodDetail initWithItem:item];
        
        [self.navigationController pushViewController:prodDetail animated:YES];
        
        // [self showViewController:det sender:self];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addItemToWishList:(id)sender {
    [[MMDWishList sharedInstance] addItemToWishList:self.currentItemToShow];
    
}

- (IBAction)retailPageButtonClicked:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
   // UINavigationController *ret = [storyboard instantiateViewControllerWithIdentifier:@"retNav"];
    
    RetailDetailViewController * brandPage = [storyboard instantiateViewControllerWithIdentifier:@"retailPage"];
    [brandPage initWithStore:self.currentItemToShow.itemStore];
    [self.navigationController pushViewController:brandPage animated:YES];

    
   // [self showViewController:ret sender:self];
}
@end
