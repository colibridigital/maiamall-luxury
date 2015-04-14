//
//  RetailDetailViewController.m
//  MaiaMall
//
//  Created by Ingrid Funie on 27/03/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "RetailDetailViewController.h"

@interface RetailDetailViewController ()

@property (strong, nonatomic) MMDStore * currentStore;

@end

@implementation RetailDetailViewController


- (void)initWithStore:(MMDStore*)store {
    self.currentStore = store;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initialiseMenuItems
{
       
    self.tabBarController.delegate =self;
    
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initialiseMenuItems];
    
    self.brandTitle.text = self.currentStore.storeTitle;
    self.brandDescription.text = self.currentStore.storeDescription;
    self.brandImage.image = self.currentStore.storeLogo;

    
}

/*- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:NO];
    
    [self initialiseMenuItems];
}*/

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

- (IBAction)offersClicked:(UIButton *)sender {
    //    if (self.currentStore.storeOffers.count > 0) {
    //
    //    } else {
    ALAlertBanner *banner = [ALAlertBanner alertBannerForView:self.view
                                                        style:ALAlertBannerStyleNotify
                                                     position:ALAlertBannerPositionTop
                                                        title:@"Sorry..."
                                                     subtitle:[NSString stringWithFormat:@"%@ does not have any offers at this time, check back soon!", self.currentStore.storeTitle]
                                                        image:nil
                                                  tappedBlock:nil];
    [banner setSecondsToShow:0];
    [banner show];
    
    //        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Sorry..." message:[NSString stringWithFormat:@"%@ does not have any offers at this time, check back soon!", self.currentStore.storeTitle] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    //        [alertView show];
    //    }
}

- (IBAction)bookAnApptClicked:(UIButton *)sender {
    
    ALAlertBanner *banner = [ALAlertBanner alertBannerForView:self.view
                                                        style:ALAlertBannerStyleNotify
                                                     position:ALAlertBannerPositionTop
                                                        title:@"Welcome"
                                                     subtitle:@"You appointment have been succesfully booked. We welcome you with joy!"
                                                        image:nil
                                                  tappedBlock:nil];
    [banner setSecondsToShow:0];
    [banner show];
    
    //    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Welcome" message:@"You appointment have been succesfully booked. We welcome you with joy!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    //    [alertView show];
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
