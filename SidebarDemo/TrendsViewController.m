//
//  TrendsViewController.m
//  MaiaMall
//
//  Created by Ingrid Funie on 07/04/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "TrendsViewController.h"

@interface TrendsViewController ()

@end

@implementation TrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBarController.delegate = self;
    
    [self.navigationItem.backBarButtonItem setTintColor:[UIColor colorWithRed:86.0/255.0 green:62.0/255.0 blue:51.0/255.0 alpha:1.0]];
    
    UITabBarItem *item = [self.tabBarController.items objectAtIndex:1];
    item.image = [[UIImage imageNamed:@"User Female-50.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item = [self.tabBarController.items objectAtIndex:0];
    item.image = [[UIImage imageNamed:@"Home-50.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item = [self.tabBarController.items objectAtIndex:2];
    item.image = [[UIImage imageNamed:@"News-50-2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item = [self.tabBarController.items objectAtIndex:3];
    item.image = [[UIImage imageNamed:@"Location-50.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    [self.view bringSubviewToFront:self.blogView];
    
    
    [self.blogView loadRequest:[NSURLRequest requestWithURL:self.url]];
    
    // Do any additional setup after loading the view.
}

-(void)initWithURL:(NSURL*)url {
    self.url = url;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.tabBarController.delegate = self;
    
    [self.navigationItem.backBarButtonItem setTintColor:[UIColor colorWithRed:86 green:62 blue:51 alpha:1.0]];
    
    UITabBarItem *item = [self.tabBarController.items objectAtIndex:1];
    item.image = [[UIImage imageNamed:@"User Female-50.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item = [self.tabBarController.items objectAtIndex:0];
    item.image = [[UIImage imageNamed:@"Home-50.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item = [self.tabBarController.items objectAtIndex:2];
    item.image = [[UIImage imageNamed:@"News-50-2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item = [self.tabBarController.items objectAtIndex:3];
    item.image = [[UIImage imageNamed:@"Location-50.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    
    [self.view bringSubviewToFront:self.blogView];

    
    [self.blogView loadRequest:[NSURLRequest requestWithURL:self.url]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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


@end
