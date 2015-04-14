//
//  ListOfItemsInTheStoreTableViewController.m
//  MaiaMall
//
//  Created by Ingrid Funie on 06/04/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "ListOfItemsInTheStoreViewController.h"
#import "SWRevealViewController.h"
#import "ProductDetailViewController.h"

@interface ListOfItemsInTheStoreViewController ()
@property (strong, nonatomic) NSMutableDictionary * dictionaryWithStoresAndItems;
@end

@implementation ListOfItemsInTheStoreViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
     self.storeTitle.text = [self.dictionaryWithStoresAndItems objectForKey:kStoreTitle];
    
    [self initialiseMenuItems];
    
}

/*- (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:NO];
 
 [self initialiseMenuItems];
 }*/

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
     self.storeTitle.text = [self.dictionaryWithStoresAndItems objectForKey:kStoreTitle];
    
    [self initialiseMenuItems];
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
    
    self.tabBarController.delegate = self;
    
    UITabBarItem *item = [self.tabBarController.items objectAtIndex:1];
    item.image = [[UIImage imageNamed:@"User Female-50.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item = [self.tabBarController.items objectAtIndex:0];
    item.image = [[UIImage imageNamed:@"Home-50.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item = [self.tabBarController.items objectAtIndex:2];
    item.image = [[UIImage imageNamed:@"News-50-2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item = [self.tabBarController.items objectAtIndex:3];
    item.image = [[UIImage imageNamed:@"Location-50.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self.navigationItem.backBarButtonItem setTintColor:[UIColor colorWithRed:86 green:62 blue:51 alpha:1.0]];

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

- (void)initWithDict:(NSMutableDictionary*)dict {
    self.dictionaryWithStoresAndItems = [[NSMutableDictionary alloc] initWithDictionary:dict];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (((NSMutableArray*)[self.dictionaryWithStoresAndItems objectForKey:kStoreItems]).count > 0) {
        return ((NSMutableArray*)[self.dictionaryWithStoresAndItems objectForKey:kStoreItems]).count;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ItemsInTheStoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"itemCell" forIndexPath:indexPath];
    
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] init];
    [dict setObject:[((NSMutableArray*)[self.dictionaryWithStoresAndItems objectForKey:kStoreItems]) objectAtIndex:indexPath.row] forKey:kItem];
    [dict setObject:[self.dictionaryWithStoresAndItems objectForKey:kStoreId] forKey:kStoreId];
    [dict setObject:[self.dictionaryWithStoresAndItems objectForKey:kStoreTitle] forKey:kStoreTitle];
    
    [cell initCellWithDictionary:dict];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    ProductDetailViewController * detailPage = [storyboard instantiateViewControllerWithIdentifier:@"prodDetailView"];
    [detailPage initWithItem:[((NSMutableArray*)[self.dictionaryWithStoresAndItems objectForKey:kStoreItems]) objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:detailPage animated:YES];
}

@end
