//
//  ViewController.m
//  SidebarDemo
//
//  Created by Simon on 28/6/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "MainViewController.h"
#import "SWRevealViewController.h"
#import "TrendCollectionViewCell.h"
#import "MapViewController.h"
#import "ProductCollectionViewCell.h"
#import "ProductListViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
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

    
    [self.trendCollectionView registerNibAndCell];
    [self.productCollectionView registerNibAndCell];
    
    [self.trendCollectionView reloadData];
    [self.productCollectionView reloadData];
    
    [self addGestureRecognizer:self.productCollectionView];
    
    self.tabBarController.delegate = self;
    
    [super viewDidLoad];

}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    if (item.tag == 1) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        
        UINavigationController *map = [storyboard instantiateViewControllerWithIdentifier:@"mapNav"];
        
       // [self performSegueWithIdentifier:@"mapNav" sender:self];
        
        [self showViewController:map sender:self];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView == self.trendCollectionView) {
        return 5;
    } else if (collectionView == self.productCollectionView) {
        return 20;
    }
    
    else return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.trendCollectionView) {
        TrendCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TREND_CELL" forIndexPath:indexPath];
        return cell;
    } else {
        ProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PROD_CELL" forIndexPath:indexPath];
        return cell;
    }
    
}

- (void)addGestureRecognizer:(ProductCollectionView *)collectionView{
//    UILongPressGestureRecognizer *lpgr
//    = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
//    lpgr.minimumPressDuration = 1.0; //seconds
//    lpgr.delaysTouchesBegan = YES;
//    lpgr.delegate = self;
//    [collectionView addGestureRecognizer:lpgr];
    
   /* NSLog(@"in here");
    
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    tgr.delegate = self;
    [collectionView addGestureRecognizer:tgr];*/
}

-(void)handleTap:(UITapGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state != UIGestureRecognizerStateEnded) {
        return;
    }
    
    NSLog(@"in here");
    
    //CGPoint p = [gestureRecognizer locationInView:gestureRecognizer.view];
    
   // ProductListViewController *prodListDetails = [[ProductListViewController alloc] initWithNibName:@"ProductListViewController" bundle:nil];
    
    
    // NSLog(@"handling tap gesture");
    
    /*if ([gestureRecognizer.view isEqual:self.productCollectionView]) {
        
         UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        
        ProductListViewController *prodListDetails = [storyboard instantiateViewControllerWithIdentifier:@"prodList"];
       // [prodListDetails setModalPresentationStyle:UIModalPresentationNone];
      
        [self presentViewController:prodListDetails animated:NO completion:nil];
    }*/
    

    [self.searchBar resignFirstResponder];
}




- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    UINavigationController *prodListDetails = [storyboard instantiateViewControllerWithIdentifier:@"prodNav"];
    
    [self showViewController:prodListDetails sender:self];
    
    [searchBar resignFirstResponder];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)filterSearchMenuClicked:(id)sender {
    
    
  /*  NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"Hello 0", @"Hello 1", @"Hello 2", @"Hello 3", nil];
    NSArray * arrImage = [[NSArray alloc] init];
    arrImage = [NSArray arrayWithObjects:[UIImage imageNamed:@"Price Tag Pound Filled-50.png"], [UIImage imageNamed:@"Price Tag Pound Filled-50.png"], [UIImage imageNamed:@"Price Tag Pound Filled-50.png"], [UIImage imageNamed:@"Price Tag Pound Filled-50.png"], nil];
    if(dropDown == nil) {
        CGFloat f = 200;
        dropDown = [[NIDropDown alloc]showDropDown:sender :&f :arr :arrImage :@"down"];
        dropDown.delegate = self;
    }
    else {
        [dropDown hideDropDown:sender];
        [self rel];
    }*/
    
}


/*- (void) niDropDownDelegateMethod: (NIDropDown *) sender {
    [self rel];
}

-(void)rel{
    //    [dropDown release];
    dropDown = nil;
}*/
@end
