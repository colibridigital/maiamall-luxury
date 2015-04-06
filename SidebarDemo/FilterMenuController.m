//
//  FilterMenuController.m
//  MaiaMall
//
//  Created by Ingrid Funie on 01/04/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "FilterMenuController.h"

@interface FilterMenuController ()
@end

@implementation FilterMenuController


-(id)init {
    
    self = [super init];
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"search %@", self.searchText);
    
}

- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:YES];
    
    NSLog(@"search %@", self.searchText);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // NSLog(@"Touch detected");
    
    [self.view endEditing:YES];
    
   // [vc1.view endEditing:YES];
    
  //  [vc1.view removeFromSuperview];
    
  //  [vc1 dismissViewControllerAnimated:YES completion:nil];
   // [self dismissViewControllerAnimated:YES completion:nil];
    //[vc1 resignFirstResponder];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)initWithSearchText:(NSString*)searchText{
    
    self.searchText = searchText;
    
}

- (IBAction)sizeFilterPressed:(id)sender {
}

- (IBAction)colourFilterPressed:(id)sender {
    NSMutableSet * setWithColors = [[NSMutableSet alloc] init];
   /* NSMutableArray * arrayWithColors = [[NSMutableArray alloc] initWithObjects:@"None", nil];
    
    for (MMDItem * item in self.arrayWithSearchResults) {
        if (item.itemColors.count > 0) {
            for (NSString * itemColor in item.itemColors) {
                [setWithColors addObject:itemColor];
            }
        }
    }
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"description" ascending:YES];
    [arrayWithColors addObjectsFromArray:[setWithColors sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]]];
    
    
    [ActionSheetStringPicker showPickerWithTitle:@"Filter by Color" rows:arrayWithColors initialSelection:0 doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
        if ([selectedValue isEqualToString:@"None"]) {
            [self.colorButton setTitle:@"Filter Colour" forState:UIControlStateNormal];
            
            MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.mode = MBProgressHUDModeIndeterminate;
            hud.labelText = @"Filtering";
            
            self.keyForColorFilter = @"None";
            
            if ([self.keyForSizeFilter isEqualToString:@"None"]) {
                
                dispatch_async(dispatch_queue_create("Filtering", nil), ^{
                    if (self.arrayWithSearchResultsBeforeFiltering.count > 0) {
                        self.arrayWithSearchResults = [[NSMutableArray alloc] initWithArray:self.arrayWithSearchResultsBeforeFiltering];
                        [self.arrayWithSearchResultsBeforeFiltering removeAllObjects];
                    }
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                        [self populateMapWithData];
                    });
                });
            } else {
                NSMutableArray * arrayWithFilteredItems = [[NSMutableArray alloc] init];
                
                if (self.arrayWithSearchResultsBeforeFiltering.count > 0) {
                    self.arrayWithSearchResults = [[NSMutableArray alloc] initWithArray:self.arrayWithSearchResultsBeforeFiltering];
                    [self.arrayWithSearchResultsBeforeFiltering removeAllObjects];
                }
                
                for (MMDItem * item in self.arrayWithSearchResults) {
                    for (NSString * size in item.itemSizes) {
                        if ([size isEqualToString:self.keyForSizeFilter]) {
                            [arrayWithFilteredItems addObject:item];
                        }
                    }
                }
                
                self.arrayWithSearchResultsBeforeFiltering = [[NSMutableArray alloc] initWithArray:self.arrayWithSearchResults];
                self.arrayWithSearchResults = [[NSMutableArray alloc] initWithArray:arrayWithFilteredItems];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                    [self populateMapWithData];
                });
                
            }
            
        } else {
            [self.colorButton setTitle:[NSString stringWithFormat:@"Colour: %@", selectedValue] forState:UIControlStateNormal];
            
            MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.mode = MBProgressHUDModeIndeterminate;
            hud.labelText = @"Filtering";
            
            dispatch_async(dispatch_queue_create("Filtering", nil), ^{
                
                NSMutableArray * arrayWithFilteredItems = [[NSMutableArray alloc] init];
                
                if (self.arrayWithSearchResultsBeforeFiltering.count > 0) {
                    self.arrayWithSearchResults = [[NSMutableArray alloc] initWithArray:self.arrayWithSearchResultsBeforeFiltering];
                    [self.arrayWithSearchResultsBeforeFiltering removeAllObjects];
                }
                
                for (MMDItem * item in self.arrayWithSearchResults) {
                    for (NSString * color in item.itemColors) {
                        if ([color isEqualToString:selectedValue]) {
                            if (![self.keyForSizeFilter isEqualToString:@"None"]) {
                                for (NSString * size in item.itemSizes) {
                                    if ([size isEqualToString:self.keyForSizeFilter]) {
                                        [arrayWithFilteredItems addObject:item];
                                    }
                                }
                            } else {
                                [arrayWithFilteredItems addObject:item];
                            }
                        }
                    }
                }
                
                self.keyForColorFilter = selectedValue;
                self.arrayWithSearchResultsBeforeFiltering = [[NSMutableArray alloc] initWithArray:self.arrayWithSearchResults];
                self.arrayWithSearchResults = [[NSMutableArray alloc] initWithArray:arrayWithFilteredItems];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                    [self populateMapWithData];
                });
            });
        }
        
        
    } cancelBlock:^(ActionSheetStringPicker *picker) {
        
    } origin:sender];*/

}

- (IBAction)priceFilterPressed:(id)sender {
}

- (IBAction)ascPriceFilterPressed:(id)sender {
}

- (IBAction)refineButtonPressed:(id)sender {
    NSLog(@"in here");
}

- (IBAction)locationFilterPressed:(id)sender {
}
@end
