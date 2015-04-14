//
//  WishlistViewController.m
//  MaiaMall
//
//  Created by Ingrid Funie on 04/04/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "WishlistViewController.h"
#import "SWRevealViewController.h"
#import "MMDWishList.h"
#import "WishlistTableViewCell.h"
#import "ProductDetailViewController.h"
#import "ProductListViewController.h"
#import "MapViewController.h"

@interface WishlistViewController ()
@property (strong, nonatomic) UILabel * messageLabel;
@end

@implementation WishlistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    
    
    if ([[MMDWishList sharedInstance] wishList].count == 0) {
        [searchBarView addSubview:self.searchBar];
        self.navigationItem.titleView = searchBarView;
    }
    
    
    [self.wishlistItems reloadData];
    
    
    self.tabBarController.delegate = self;
    
    UITabBarItem *item = [self.tabBarController.items objectAtIndex:1];
    item.image = [[UIImage imageNamed:@"User Female-50.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item = [self.tabBarController.items objectAtIndex:0];
    item.image = [[UIImage imageNamed:@"Home-50.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item = [self.tabBarController.items objectAtIndex:2];
    item.image = [[UIImage imageNamed:@"News-50-2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item = [self.tabBarController.items objectAtIndex:3];
    item.image = [[UIImage imageNamed:@"Location-50.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    // dropDown.table.delegate = self;
    
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated {
    
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(-5.0, 0.0, 320.0, 44.0)];
    self.searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    UIView *searchBarView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 310.0, 44.0)];
    searchBarView.autoresizingMask = 0;
    self.searchBar.delegate = self;
    //searchBar.backgroundImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MaiaMall-Logo-Light" ofType: @"jpg"]];
    self.searchBar.backgroundImage = [[UIImage alloc] init];
    
    if ([[MMDWishList sharedInstance] wishList].count == 0) {
        [searchBarView addSubview:self.searchBar];
        self.navigationItem.titleView = searchBarView;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([[MMDWishList sharedInstance] wishList].count > 0) {
        [self.messageLabel setText:@""];
        self.wishlistItems.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        return [[MMDWishList sharedInstance] wishList].count;
    } else {
        // Display a message when the table is empty
        self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        
        self.messageLabel.text = @"You still have no items in Wish List. Search for goods at main page and add them from detail page.";
        self.messageLabel.textColor = [UIColor lightGrayColor];
        self.messageLabel.numberOfLines = 0;
        self.messageLabel.textAlignment = NSTextAlignmentCenter;
        self.messageLabel.font = [UIFont fontWithName:@"Palatino-Italic" size:20];
        [self.messageLabel sizeToFit];
        
        self.wishlistItems.backgroundView = self.messageLabel;
        self.wishlistItems.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(-5.0, 0.0, 320.0, 44.0)];
        self.searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        UIView *searchBarView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 310.0, 44.0)];
        searchBarView.autoresizingMask = 0;
        self.searchBar.delegate = self;
        //searchBar.backgroundImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MaiaMall-Logo-Light" ofType: @"jpg"]];
        self.searchBar.backgroundImage = [[UIImage alloc] init];
        
        [searchBarView addSubview:self.searchBar];
        self.navigationItem.titleView = searchBarView;
        
        return 0;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WishlistTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"itemCell" forIndexPath:indexPath];
    
    [cell initWithItem:[[[MMDWishList sharedInstance] wishList] objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    ProductDetailViewController *prodDetail = [storyboard instantiateViewControllerWithIdentifier:@"prodDetailView"];

    [prodDetail initWithItem:[[[MMDWishList sharedInstance] wishList] objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:prodDetail animated:YES];
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [[MMDWishList sharedInstance] removeItemFromWishListAtObjectIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return NO;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [self.searchBar resignFirstResponder];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    //UINavigationController *prodListDetails = [storyboard instantiateViewControllerWithIdentifier:@"prodNav"];
    
    // [self showViewController:prodListDetails sender:self];
    
    [self.searchBar resignFirstResponder];
    
    
    dispatch_async(dispatch_queue_create("Search", nil), ^{
        
        NSMutableArray * arrayWithSearchResults = [[NSMutableArray alloc] init];
        
        for (MMDItem* item in [[MMDDataBase database] arrayWithItems]) {
            if (![[NSUserDefaults standardUserDefaults] boolForKey:kFemaleOrMaleSwitch]) {
                if ((([[item.itemTitle lowercaseString] rangeOfString:[self.searchBar.text lowercaseString]].location != NSNotFound) || ([[item.itemCategory lowercaseString] rangeOfString:[self.searchBar.text lowercaseString]].location != NSNotFound)) && item.itemGender == female) {
                    [arrayWithSearchResults addObject:item];
                }
            } else {
                if (([[item.itemTitle lowercaseString] rangeOfString:[self.searchBar.text lowercaseString]].location != NSNotFound) || ([[item.itemCategory lowercaseString] rangeOfString:[self.searchBar.text lowercaseString]].location != NSNotFound)) {
                    [arrayWithSearchResults addObject:item];
                }
            }

            
        }
        
        if (arrayWithSearchResults.count > 0) {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
                ProductListViewController * searchPage = [storyboard instantiateViewControllerWithIdentifier:@"prodListSearchDetails"];
                [searchPage initWithArrayWithSearchResults:arrayWithSearchResults andTextForSearch:self.searchBar.text];
                [self.navigationController pushViewController:searchPage animated:YES];
            });
        }
    });
    
    
}

- (IBAction)filterSearchMenuClicked:(id)sender {
    
    self.arrayWithSearchResults = [[NSMutableArray alloc] init];
    
    for (MMDItem* item in [[MMDDataBase database] arrayWithItems]) {
        if (![[NSUserDefaults standardUserDefaults] boolForKey:kFemaleOrMaleSwitch]) {
            if ((([[item.itemTitle lowercaseString] rangeOfString:[self.searchBar.text lowercaseString]].location != NSNotFound) || ([[item.itemCategory lowercaseString] rangeOfString:[self.searchBar.text lowercaseString]].location != NSNotFound)) && item.itemGender == female){
                [self.arrayWithSearchResults addObject:item];
            }
        } else {
            if (([[item.itemTitle lowercaseString] rangeOfString:[self.searchBar.text lowercaseString]].location != NSNotFound) || ([[item.itemCategory lowercaseString] rangeOfString:[self.searchBar.text lowercaseString]].location != NSNotFound)) {
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
