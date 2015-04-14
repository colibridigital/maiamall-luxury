//
//  SettingsViewController.m
//  MaiaMall
//
//  Created by Ingrid Funie on 04/04/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "SettingsViewController.h"
#import "SWRevealViewController.h"
#import "MapViewController.h"
#import "ProductListViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)setSwitchColourToFemale {
    
    self.femaleMaleSwitch.onTintColor = femaleColor;
    
    self.femaleMaleSwitch.tintColor = femaleColor;
    self.femaleMaleSwitch.backgroundColor = femaleColor;
    self.femaleMaleSwitch.layer.cornerRadius = 16.0;
}

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
    
    [searchBarView addSubview:self.searchBar];
    self.navigationItem.titleView = searchBarView;
    
    self.tabBarController.delegate = self;
    
    UITabBarItem *item = [self.tabBarController.items objectAtIndex:1];
    item.image = [[UIImage imageNamed:@"User Female-50.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item = [self.tabBarController.items objectAtIndex:0];
    item.image = [[UIImage imageNamed:@"Home-50.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item = [self.tabBarController.items objectAtIndex:2];
    item.image = [[UIImage imageNamed:@"News-50-2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item = [self.tabBarController.items objectAtIndex:3];
    item.image = [[UIImage imageNamed:@"Location-50.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    [self setSwitchColourToFemale];
}

- (void)viewDidAppear:(BOOL)animated {
    bool maleFemale = [[NSUserDefaults standardUserDefaults] boolForKey:kFemaleOrMaleSwitch];
    [self setSwitchTo:maleFemale];
}

- (void)setSwitchColourToMale {
    
    self.femaleMaleSwitch.onTintColor = maleColor;
    
    self.femaleMaleSwitch.tintColor = maleColor;
    self.femaleMaleSwitch.backgroundColor = maleColor;
    self.femaleMaleSwitch.layer.cornerRadius = 16.0;
}

- (void)setSwitchTo:(BOOL)on {
    if (on) {
        [self setSwitchColourToFemale];
    } else {
        [self setSwitchColourToMale];
    }
    [self.femaleMaleSwitch setOn:on];
}

- (IBAction)switchChanged:(UISwitch *)sender {
    
    [self setSwitchTo:sender.isOn];
    
    [[NSUserDefaults standardUserDefaults] setBool:sender.isOn forKey:kFemaleOrMaleSwitch];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [_delegate genderWasChangedFrom:[[NSUserDefaults standardUserDefaults] boolForKey:kFemaleOrMaleSwitch] to:sender.isOn];
    
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
            if ((([[item.itemTitle lowercaseString] rangeOfString:[self.searchBar.text lowercaseString]].location != NSNotFound) || ([[item.itemCategory lowercaseString] rangeOfString:[self.searchBar.text lowercaseString]].location != NSNotFound)) && item.itemGender == female) {
                [self.arrayWithSearchResults addObject:item];
            }
        } else {
            if (([[item.itemTitle lowercaseString] rangeOfString:[self.searchBar.text lowercaseString]].location != NSNotFound) || ([[item.itemCategory lowercaseString] rangeOfString:[self.searchBar.text lowercaseString]].location != NSNotFound))  {
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
