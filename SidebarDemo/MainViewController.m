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
@synthesize filterSearchMenuButton;

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
    
    [self.dropDown setDelegate:self];
    
    [self.view addSubview:self.dropDown];
    
    
    //[self addGestureRecognizer:self.productCollectionView];
    
     // gestureRecognizer.delegate = self;
    
    self.tabBarController.delegate = self;
    
    
   // dropDown.table.delegate = self;
    
    [super viewDidLoad];

}


//-(void)handleTap:(UITapGestureRecognizer *)gestureRecognizer {
//      if (gestureRecognizer.state != UIGestureRecognizerStateEnded) {
//            return;
//        }
//    CGPoint p = [gestureRecognizer locationInView:gestureRecognizer.view];
//    
//    NSIndexPath *index = [self.dropDown.table indexPathForRowAtPoint:p];
//    
//    if (index.row == 1) {
//    
//        NSLog(@"index : %li", (long)index.row);
//    }else {
//         NSLog(@"indexxxx : %li", (long)index.row);
//    }
//}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
   // NSLog(@"Touch detected");
    
    [self.view endEditing:YES];
    [self.searchBar resignFirstResponder];
    
}

/*- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return CGRectContainsPoint([[self dropDown] frame], [touch locationInView:[self view]]) && !(CGRectContainsPoint([[self trendCollectionView] frame], [touch locationInView:[self view]]));
}*/


-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    // return
    return true;
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

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (collectionView == self.productCollectionView) {
    
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
        UINavigationController *det = [storyboard instantiateViewControllerWithIdentifier:@"detNav"];
        
        [self showViewController:det sender:self];
    }
    
}

- (void)addGestureRecognizer:(UICollectionView *)collectionView{
    //    UILongPressGestureRecognizer *lpgr
    //    = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    //    lpgr.minimumPressDuration = 1.0; //seconds
    //    lpgr.delaysTouchesBegan = YES;
    //    lpgr.delegate = self;
    //    [collectionView addGestureRecognizer:lpgr];
    
     NSLog(@"in here");
     
     UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
     tgr.delegate = self;
     [collectionView addGestureRecognizer:tgr];
}


//-(void)handleTap:(UITapGestureRecognizer *)gestureRecognizer {
//    if (gestureRecognizer.state != UIGestureRecognizerStateEnded) {
//        return;
//    }
//    
//    CGPoint p = [gestureRecognizer locationInView:gestureRecognizer.view];
//    
//   // NSIndexPath *index = [self.productCollectionView indexPathForItemAtPoint:p];
//    
//    if ([gestureRecognizer.view isEqual:self.productCollectionView]) {
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
//        
//        UINavigationController *prodListDetails = [storyboard instantiateViewControllerWithIdentifier:@"prodList"];
//        
//        // [prodListDetails setModalPresentationStyle:UIModalPresentationNone];
//        
//        [self presentViewController:prodListDetails animated:NO completion:nil];
//
//    }
//
//    [self.searchBar resignFirstResponder];
//}



- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [self.searchBar resignFirstResponder];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    UINavigationController *prodListDetails = [storyboard instantiateViewControllerWithIdentifier:@"prodNav"];
    
    [self showViewController:prodListDetails sender:self];
    
    [self.searchBar resignFirstResponder];
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
    
    [self.view bringSubviewToFront:self.dropDown];
    
    self.dropDown.userInteractionEnabled = TRUE;
    self.dropDown.table.userInteractionEnabled = TRUE;
    
    
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"", @"",@"", nil];
    NSArray * arrImage = [[NSArray alloc] init];
    arrImage = [NSArray arrayWithObjects:[UIImage imageNamed:@"Alphabetical Sorting Az-50.png"], [UIImage imageNamed:@"Location Filled-50.png"], [UIImage imageNamed:@"Price Tag Pound Filled-50.png"], nil];
    if(self.dropDown == nil) {
        CGFloat f = 120;
        self.dropDown = [[NIDropDown alloc]showDropDown:sender :&f :arr :arrImage :@"down"];
        self.dropDown.delegate = self;
    }
    else {
        [self.dropDown hideDropDown:sender];
        [self rel];
    }
    
}



- (void) niDropDownDelegateMethod: (NIDropDown *) sender {
    [self rel];
}

-(void)rel{
    //    [dropDown release];
    self.dropDown = nil;
}


@end
