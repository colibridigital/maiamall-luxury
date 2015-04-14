//
//  ProductListViewController.m
//  MaiaMall
//
//  Created by Ingrid Funie on 18/03/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "ProductListViewController.h"
#import "ProductListCollectionViewCell.h"
#import "SWRevealViewController.h"
#import "ProductDetailViewController.h"
#import "FilterMenuController.h"


@interface ProductListViewController ()

@property (strong, nonatomic) NSMutableArray * arrayWithSearchResults; //array of MMDItems
@property (strong, nonatomic) NSString * searchText;
@property(strong, nonatomic) FilterMenuController *filterMenuController;

@end

@implementation ProductListViewController

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
    
    [self.searchBar setText:self.searchText];

    
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
    
}

- (void)initWithArrayWithSearchResults:(NSMutableArray*)array andTextForSearch:(NSString*)searchText {
    self.arrayWithSearchResults = [[NSMutableArray alloc] initWithArray:[array copy]];
    self.searchText = searchText;
    
    NSLog(@"array %lu", self.arrayWithSearchResults.count);
    
    //[self.prodListCollectionView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initialiseMenuItems];

    // Do any additional setup after loading the view.
    
    [self.prodListCollectionView registerNibAndCell];
    [self.prodListCollectionView reloadData];
    
}

- (void) viewDidAppear:(BOOL)animated {
        [super viewDidAppear:NO];
        // Do any additional setup after loading the view.
    
    [self initialiseMenuItems];
        
        [self.prodListCollectionView registerNibAndCell];
        [self.prodListCollectionView reloadData];

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
    return self.arrayWithSearchResults.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ProductListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DETAIL_CELL" forIndexPath:indexPath];
    
    NSString *imagePath = ((MMDItem*)[self.arrayWithSearchResults objectAtIndex:indexPath.item]).itemImagePath;
    UIImage *itemImage = [UIImage imageWithContentsOfFile:imagePath];
    cell.detailImage.image = itemImage;
    
   // UIImage *img = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"product2" ofType: @"png"]];
    
    //cell.detailImage = [[UIImageView alloc] initWithImage:img];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    ProductDetailViewController *prodDetail = [storyboard instantiateViewControllerWithIdentifier:@"prodDetailView"];
    
    MMDItem* item = [self.arrayWithSearchResults objectAtIndex:indexPath.row];
    
    [prodDetail initWithItem:item];
    
    [self.navigationController pushViewController:prodDetail animated:YES];
    
    //UINavigationController *det = [storyboard instantiateViewControllerWithIdentifier:@"detNav"];
        
    //[self showViewController:det sender:self];

}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"FilterMenuSegue"])
    {
        self.filterMenuController = [segue destinationViewController];
        [self.filterMenuController initWithArrayWithSearchResults:self.arrayWithSearchResults andTextForSearch:self.searchText];
        [self.filterMenuController setIsInMapView:NO];
        
        WYStoryboardPopoverSegue *popoverSegue = (WYStoryboardPopoverSegue *)segue;
        self.anotherPopoverController = [popoverSegue popoverControllerWithSender:sender
                                                    permittedArrowDirections:WYPopoverArrowDirectionDown
                                                                    animated:YES
                                                                     options:WYPopoverAnimationOptionFadeWithScale];
        
        self.filterMenuController.prodList = self;
        
        self.anotherPopoverController.popoverContentSize = CGSizeMake(220, 360);
        
        self.anotherPopoverController.delegate = self;
        
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
    if (controller == self.anotherPopoverController)
    {
        self.anotherPopoverController.delegate = nil;
        self.anotherPopoverController = nil;
        //[self.prodListCollectionView reloadData];
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


- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [self.searchBar resignFirstResponder];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    //UINavigationController *prodListDetails = [storyboard instantiateViewControllerWithIdentifier:@"prodNav"];
    
    // [self showViewController:prodListDetails sender:self];
    [self.searchBar resignFirstResponder];
    
    
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
        
        if (self.arrayWithSearchResults.count > 0) {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self initWithArrayWithSearchResults:self.arrayWithSearchResults andTextForSearch:self.searchBar.text];
                [self.prodListCollectionView reloadData];
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

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
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
