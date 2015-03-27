//
//  CollectionListViewController.m
//  MaiaMall
//
//  Created by Ingrid Funie on 27/03/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "CollectionListViewController.h"
#import "SWRevealViewController.h"
#import "CollectionDetailCollectionViewCell.h"

@interface CollectionListViewController ()

@end

@implementation CollectionListViewController

- (void)initialiseMenuItems {
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
