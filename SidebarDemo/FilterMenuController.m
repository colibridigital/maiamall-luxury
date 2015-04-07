//
//  FilterMenuController.m
//  MaiaMall
//
//  Created by Ingrid Funie on 01/04/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "FilterMenuController.h"


@interface FilterMenuController () {
    
}
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
    
    self.pickerViewData = [[NSMutableArray alloc] initWithObjects:@"None", nil];
    
   self.arrayWithColors = [[NSMutableArray alloc] initWithObjects:@"None", nil];
    self.arrayWithSize = [[NSMutableArray alloc] initWithObjects:@"None", nil];

    
}

- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:YES];
    
    NSLog(@"search %@", self.searchText);
    
    self.pickerViewData = [[NSMutableArray alloc] initWithObjects:@"None", nil];
    
    self.arrayWithColors = [[NSMutableArray alloc] initWithObjects:@"None", nil];
    self.arrayWithSize = [[NSMutableArray alloc] initWithObjects:@"None", nil];
    
    [self.colourFilter setSelected:NO];
    [self.sizeFilter setSelected:NO];


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

-(void)initWithArrayWithSearchResults:(NSMutableArray*)array andTextForSearch:(NSString*)searchText {
    
    self.searchText = searchText;
    self.arrayWithSearchResults = array;
    
}

// Number of components.
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// Total rows in our component.
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return self.pickerViewData.count;
}

// Display each row's data.
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [self.pickerViewData objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    //    NSLog(@"You selected this: %@", [self.pickerViewData objectAtIndex: row]);
    
    
    if (self.colourFilter.isSelected && !self.sizeFilter.isSelected) {
        
        NSString* selectedValue = [self.arrayWithColors objectAtIndex:row];
        
        if ([selectedValue isEqualToString:@"None"]) {
            
            MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.mode = MBProgressHUDModeIndeterminate;
            hud.labelText = @"Filtering";
            
            self.keyForColorFilter = @"None";
            
            dispatch_async(dispatch_queue_create("Filtering", nil), ^{
                if (self.arrayWithSearchResultsBeforeFiltering.count > 0) {
                    self.arrayWithSearchResults = [[NSMutableArray alloc] initWithArray:self.arrayWithSearchResultsBeforeFiltering];
                    [self.arrayWithSearchResultsBeforeFiltering removeAllObjects];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                    
                    NSLog(@"in filter 1");
                    
                    if(!self.isInMapView) {
                    
                        [self.prodList initWithArrayWithSearchResults:self.arrayWithSearchResults andTextForSearch:self.searchText];
                    } else {
                        [self.map initWithArrayWithSearchResults:self.arrayWithSearchResults andTextForSearch:self.searchText];
                    }
                    
                });
            });
            
            
        } else {
            
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
                            
                            [arrayWithFilteredItems addObject:item];
                            
                        }
                    }
                }
                
                self.keyForColorFilter = selectedValue;
                self.arrayWithSearchResultsBeforeFiltering = [[NSMutableArray alloc] initWithArray:self.arrayWithSearchResults];
                self.arrayWithSearchResults = [[NSMutableArray alloc] initWithArray:arrayWithFilteredItems];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                    
                    NSLog(@"in filter 2 %lu", self.arrayWithSearchResults.count);
                    
                    if (!self.isInMapView) {
                    
                        [self.prodList initWithArrayWithSearchResults:self.arrayWithSearchResults andTextForSearch:self.searchText];
                    } else {
                        [self.map initWithArrayWithSearchResults:self.arrayWithSearchResults andTextForSearch:self.searchText];
                    }
                });
            });
        }
    } else if (self.sizeFilter.isSelected && !self.colourFilter.isSelected) {
        
        NSString* selectedValue = [self.arrayWithSize objectAtIndex:row];
        
        if ([selectedValue isEqualToString:@"None"]) {
            
            MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.mode = MBProgressHUDModeIndeterminate;
            hud.labelText = @"Filtering";
            
            self.keyForSizeFilter = @"None";
            
            dispatch_async(dispatch_queue_create("Filtering", nil), ^{
                if (self.arrayWithSearchResultsBeforeFiltering.count > 0) {
                    self.arrayWithSearchResults = [[NSMutableArray alloc] initWithArray:self.arrayWithSearchResultsBeforeFiltering];
                    [self.arrayWithSearchResultsBeforeFiltering removeAllObjects];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                    NSLog(@"in filter 3 %lu", self.arrayWithSearchResults.count);
                    
                    if(!self.isInMapView) {
                    
                        [self.prodList initWithArrayWithSearchResults:self.arrayWithSearchResults andTextForSearch:self.searchText];
                    } else {
                        [self.map initWithArrayWithSearchResults:self.arrayWithSearchResults andTextForSearch:self.searchText];
                    }
                });
            });
            
        } else {
            
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
                    for (NSString * size in item.itemSizes) {
                        if ([size isEqualToString:selectedValue]) {
                            
                            [arrayWithFilteredItems addObject:item];
                            
                        }
                    }
                }
                
                self.keyForSizeFilter = selectedValue;
                self.arrayWithSearchResultsBeforeFiltering = [[NSMutableArray alloc] initWithArray:self.arrayWithSearchResults];
                self.arrayWithSearchResults = [[NSMutableArray alloc] initWithArray:arrayWithFilteredItems];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                    
                    NSLog(@"in filter 4 %lu", self.arrayWithSearchResults.count);
                    if (!self.isInMapView) {
                        [self.prodList initWithArrayWithSearchResults:self.arrayWithSearchResults andTextForSearch:self.searchText];
                    } else {
                        [self.map initWithArrayWithSearchResults:self.arrayWithSearchResults andTextForSearch:self.searchText];
                    }
                });
            });
        }
        
    } else if (self.colourFilter.isSelected && self.sizeFilter.isSelected) {
        
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
                for (NSString * size in item.itemSizes) {
                    if (![self.keyForSizeFilter isEqualToString:@"None"]) {
                        if (![self.keyForColorFilter isEqualToString:@"None"]) {
                            for (NSString * color in item.itemColors) {
                                if ([color isEqualToString:self.keyForColorFilter] && [size isEqualToString:self.keyForSizeFilter]) {
                                    [arrayWithFilteredItems addObject:item];
                                }
                            }
                        } else {
                            [arrayWithFilteredItems addObject:item];
                        }
                    }
                }
            }
            
            self.arrayWithSearchResultsBeforeFiltering = [[NSMutableArray alloc] initWithArray:self.arrayWithSearchResults];
            self.arrayWithSearchResults = [[NSMutableArray alloc] initWithArray:arrayWithFilteredItems];
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                
                NSLog(@"in filter 5 %lu", self.arrayWithSearchResults.count);
                
                if(!self.isInMapView) {
                
                    [self.prodList initWithArrayWithSearchResults:self.arrayWithSearchResults andTextForSearch:self.searchText];
                } else {
                    
                    [self.map initWithArrayWithSearchResults:self.arrayWithSearchResults andTextForSearch:self.searchText];
                }
            });
        });
    }
    
    
    
}


- (IBAction)sizeFilterPressed:(id)sender {
    
    NSMutableSet * setWithSizes = [[NSMutableSet alloc] init];
    
    for (MMDItem * item in self.arrayWithSearchResults) {
        if (item.itemSizes.count > 0) {
            for (NSString * itemSize in item.itemSizes) {
                [setWithSizes addObject:itemSize];
            }
        }
    }
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"description" ascending:YES];
    [self.arrayWithSize addObjectsFromArray:[setWithSizes sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]]];
    
    [self.sizeFilter setSelected:YES];
    
    NSLog(@"how many sizes %lu", self.arrayWithSize.count);
    
    self.pickerViewData = self.arrayWithSize;
    
    [self.pickerView reloadAllComponents];

}

- (IBAction)colourFilterPressed:(id)sender {
    NSMutableSet * setWithColors = [[NSMutableSet alloc] init];
    
   // NSMutableArray * arrayWithColors = [[NSMutableArray alloc] initWithObjects:@"None", nil];
    
    for (MMDItem * item in self.arrayWithSearchResults) {
        if (item.itemColors.count > 0) {
            for (NSString * itemColor in item.itemColors) {
                [setWithColors addObject:itemColor];
            }
        }
    }
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"description" ascending:YES];
    [self.arrayWithColors addObjectsFromArray:[setWithColors sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]]];
    
    [self.colourFilter setSelected:YES];
    
    NSLog(@"how many colours %lu", self.arrayWithColors.count);
    
    self.pickerViewData = self.arrayWithColors;
    
    [self.pickerView reloadAllComponents];
    
}

- (IBAction)priceFilterPressed:(id)sender {
}

- (IBAction)ascPriceFilterPressed:(id)sender {
}

- (IBAction)refineButtonPressed:(id)sender {
    NSLog(@"in here");
    
    if (!self.isInMapView) {
        
        [self.prodList initWithArrayWithSearchResults:self.arrayWithSearchResults andTextForSearch:self.searchText];
        
        [self.prodList.anotherPopoverController dismissPopoverAnimated:YES];
        
        [self.prodList.prodListCollectionView reloadData];
    } else {
        [self.map initWithArrayWithSearchResults:self.arrayWithSearchResults andTextForSearch:self.searchText];
        
        [self.map.anotherPopoverController dismissPopoverAnimated:YES];
        
        [self.map populateMapWithData];
    }
}

- (IBAction)locationFilterPressed:(id)sender {
}
@end
