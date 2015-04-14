//
//  BlogViewController.m
//  MaiaMall
//
//  Created by Ingrid Funie on 27/03/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "BlogViewController.h"
#import "SWRevealViewController.h"
#import "MapViewController.h"

@interface BlogViewController ()

@end

@implementation BlogViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(-5.0, 0.0, 320.0, 44.0)];
    self.searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    UIView *searchBarView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 310.0, 44.0)];
    searchBarView.autoresizingMask = 0;
    self.searchBar.delegate = self;
    //searchBar.backgroundImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MaiaMall-Logo-Light" ofType: @"jpg"]];
    self.searchBar.backgroundImage = [[UIImage alloc] init];
    
    
    [searchBarView addSubview:self.searchBar];
    self.navigationItem.titleView = searchBarView;
    
    self.folllowButton.layer.cornerRadius = 2;
    self.folllowButton.layer.borderWidth = 1;
    self.folllowButton.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.firstBlogPage.layer.cornerRadius = 1;
    self.firstBlogPage.layer.borderWidth = 2;
    self.firstBlogPage.layer.borderColor = [UIColor darkGrayColor].CGColor;
    
    self.firstBlogPage.text = @"Culottes and jumpsuits can be intimidating pieces to pull off—put the two together and you’ve got quite the challenge. But before you wave the white flag in sartorial surrender, consider this advice from Rebecca Taylor: As the talented designer recently told InStyle, ''It’s all about proportions—make sure the length hits midcalf and pair it with a wedge to elongate your legs.'' So, are you ready to test out the season’s coolest look?";
    
    self.secondBlogPage.layer.cornerRadius = 1;
    self.secondBlogPage.layer.borderWidth = 2;
    self.secondBlogPage.layer.borderColor = [UIColor darkGrayColor].CGColor;
    
    self.secondBlogPage.text = @"Parisians have had a love affair with Los Angeles for a while now, but in recent years fashion types have seemed particularly drawn to the city. The casual California aesthetic can be found at the core of many Parisian-designed collections, while French fashion bloggers are regularly spotted posing amongst L.A.’s palm trees in those very wares. When Hedi Slimane boldly decided to move the Saint Laurent studio from Paris to the West Coast city, it was clear the infatuation had reached its peak. Though the area does have a robust garment industry, it’s of no use to designers like Slimane, whose collections are currently executed in France. ''Los Angeles has a vibrant mythology that I find rather inspiring,'' Slimane has explained to The New York Times.";

    self.thirdBlogPage.layer.cornerRadius = 1;
    self.thirdBlogPage.layer.borderWidth = 2;
    self.thirdBlogPage.layer.borderColor = [UIColor darkGrayColor].CGColor;
    
    self.thirdBlogPage.text = @"Ultra-flattering flared jeans are back, and we couldn’t be happier about it. Wear them as you would any other pair of pants. If you’re on the petite side, we highly recommend opting for a longer style paired with heels.";
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sndTextViewTapped:)];
    [self.secondBlogPage addGestureRecognizer:gestureRecognizer];
    
    UITapGestureRecognizer *gestureRecognizer2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(thirdTextViewTapped:)];
    [self.thirdBlogPage addGestureRecognizer:gestureRecognizer2];
    
    self.tabBarController.delegate =self;
    
    UITabBarItem *item = [self.tabBarController.items objectAtIndex:1];
    item.image = [[UIImage imageNamed:@"User Female-50.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item = [self.tabBarController.items objectAtIndex:0];
    item.image = [[UIImage imageNamed:@"Home-50.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item = [self.tabBarController.items objectAtIndex:2];
    item.image = [[UIImage imageNamed:@"News-50-2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item = [self.tabBarController.items objectAtIndex:3];
    item.image = [[UIImage imageNamed:@"Location-50.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}

-(void)sndTextViewTapped:(UITapGestureRecognizer *)gestureRecognizer {
    NSString* textToKeep = self.firstBlogPage.text;
    
    self.firstBlogPage.text = self.secondBlogPage.text;
    self.secondBlogPage.text = textToKeep;
    
}

-(void)thirdTextViewTapped:(UITapGestureRecognizer *)gestureRecognizer {
    NSString* textToKeep = self.firstBlogPage.text;
    
    self.firstBlogPage.text = self.thirdBlogPage.text;
    self.thirdBlogPage.text = textToKeep;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initialiseMenuItems];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:NO];
    
    [self initialiseMenuItems];
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

- (IBAction)filterSearchMenuClicked:(id)sender {
    
    self.arrayWithSearchResults = [[NSMutableArray alloc] init];
    
    for (MMDItem* item in [[MMDDataBase database] arrayWithItems]) {
        if (![[NSUserDefaults standardUserDefaults] boolForKey:kFemaleOrMaleSwitch]) {
            if ([[item.itemTitle lowercaseString] rangeOfString:[self.searchBar.text lowercaseString]].location != NSNotFound && item.itemGender == female) {
                [self.arrayWithSearchResults addObject:item];
            }
        } else {
            if ([[item.itemTitle lowercaseString] rangeOfString:[self.searchBar.text lowercaseString]].location != NSNotFound) {
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
