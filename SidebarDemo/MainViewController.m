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

    
    self.appDelegate = [[AppDelegate alloc] init];
    
    self.arrayWithRecommendedItems = [[NSMutableArray alloc] init];
    
    
    [searchBarView addSubview:self.searchBar];
    self.navigationItem.titleView = searchBarView;

    
    [self.trendCollectionView registerNibAndCell];
    [self.productCollectionView registerNibAndCell];
    
    [self.trendCollectionView reloadData];
    [self.productCollectionView reloadData];
    
    
    self.tabBarController.delegate = self;
    
    
   // dropDown.table.delegate = self;
    
    [super viewDidLoad];

}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kDataBaseWasInitiated]) {
        [self getTrendingItems];
    } 
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:kDataBaseWasInitiated]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSLog(@"view did appear before database init");

            [MMDDataBase database];
            //[NSThread sleepForTimeInterval:300.0];
            
            [self getTrendingItems];
        });
        
    }
}

- (void)getTrendingItems {
    
    //totally dummy. that is why it is done in such dummy way. Should be rewritten when possible.
    
    if (self.arrayWithRecommendedItems.count == 0) {
       
        dispatch_async(dispatch_queue_create("Trend loading", nil), ^{
            NSMutableArray * tempArray = [[NSMutableArray alloc] init];
        
                for (MMDItem* item in [[MMDDataBase database] arrayWithItems]) {
                    
                    if (item.itemGender == female) {
                        
                                int category = arc4random() % 3;
                        if ([item.itemCategory isEqualToString:(category == 0 ? @"Shirts" : (category == 1 ? @"Dresses" : (category == 2 ? @"Bags" : @"Shoes")))]) {
                                    [tempArray addObject:item];
                                }
                        }
                }
            
            
            if (tempArray.count > 0) {
                [self.arrayWithRecommendedItems removeAllObjects];
                for (int i = 0; i < (tempArray.count > 15 ? 15 : tempArray.count); i++) {
                    int index = arc4random() % tempArray.count;
                    [self.arrayWithRecommendedItems addObject:[tempArray objectAtIndex:index]];
                    [tempArray removeObjectAtIndex:index];
                }
            }
         dispatch_async(dispatch_get_main_queue(), ^{
                
             [self.productCollectionView reloadData];
         });
        });
    }
    
}




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
        
        NSLog(@"count of items: %lu", self.arrayWithRecommendedItems.count);
        
        return self.arrayWithRecommendedItems.count;
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
        
        NSLog(@"in showing the cell");
        
        cell.productImage.image = ((MMDItem*)[self.arrayWithRecommendedItems objectAtIndex:indexPath.item]).itemImage;
        
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





/*
- (IBAction)filterSearchMenuClicked:(id)sender {
    
   /* [self.view bringSubviewToFront:self.dropDown];
    
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
    }*/
    
//}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"FilterMenuSegue"])
    {
        NSLog(@"in here");
        
        WYStoryboardPopoverSegue *popoverSegue = (WYStoryboardPopoverSegue *)segue;
        anotherPopoverController = [popoverSegue popoverControllerWithSender:sender
                                                    permittedArrowDirections:WYPopoverArrowDirectionDown
                                                                    animated:YES
                                                                     options:WYPopoverAnimationOptionFadeWithScale];
        
        anotherPopoverController.popoverContentSize = CGSizeMake(220, 360);
        
        anotherPopoverController.delegate = self;
    }
}

#pragma mark - WYPopoverControllerDelegate

- (void)popoverControllerDidPresentPopover:(WYPopoverController *)controller
{
    NSLog(@"popoverControllerDidPresentPopover");
}

- (BOOL)popoverControllerShouldDismissPopover:(WYPopoverController *)controller
{
    return YES;
}

- (void)popoverControllerDidDismissPopover:(WYPopoverController *)controller
{
    if (controller == anotherPopoverController)
    {
        anotherPopoverController.delegate = nil;
        anotherPopoverController = nil;
    }
   
}

- (BOOL)popoverControllerShouldIgnoreKeyboardBounds:(WYPopoverController *)popoverController
{
    return YES;
}

- (void)popoverController:(WYPopoverController *)popoverController willTranslatePopoverWithYOffset:(float *)value
{
    // keyboard is shown and the popover will be moved up by 163 pixels for example ( *value = 163 )
    *value = 0; // set value to 0 if you want to avoid the popover to be moved
}





@end
