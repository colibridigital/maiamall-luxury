//
//  CollectionListViewController.m
//  MaiaMall
//
//  Created by Ingrid Funie on 27/03/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "CollectionListViewController.h"
#import "CollectionDetailCollectionViewCell.h"
#import "ProductDetailViewController.h"

@interface CollectionListViewController ()

@end

@implementation CollectionListViewController

- (void)initialiseMenuItems {
    
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
    
    [self.collectionDetailView registerNibAndCell];
    [self.collectionDetailView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initialiseMenuItems];
    
    // Do any additional setup after loading the view.
    
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:NO];
    // Do any additional setup after loading the view.
    
    [self initialiseMenuItems];
    
      
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
        
    } else
        if (item.tag == 1) {
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
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionDetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"COLLDET_CELL" forIndexPath:indexPath];
    
    // UIImage *img = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"product2" ofType: @"png"]];
    
    //cell.detailImage = [[UIImageView alloc] initWithImage:img];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        
        ProductDetailViewController *prodDetail = [storyboard instantiateViewControllerWithIdentifier:@"prodDetailView"];
        
        // UINavigationController *det = [storyboard instantiateViewControllerWithIdentifier:@"detNav"];
        
        [self showViewController:prodDetail sender:self];
   
    
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
