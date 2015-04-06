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
    
   self.arrayWithColors = [[NSMutableArray alloc] init];
    self.arrayWithSize = [[NSMutableArray alloc] init];
    
}

- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:YES];
    
    NSLog(@"search %@", self.searchText);
    
    self.arrayWithColors = [[NSMutableArray alloc] init];
    self.arrayWithSize = [[NSMutableArray alloc] init];

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
    
    if (self.colourFilter.isSelected) {
        return [self.arrayWithColors count];
    } else if (self.sizeFilter.isSelected) {
        return [self.arrayWithSize count];
    } else return 0;
}

// Display each row's data.
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.arrayWithColors objectAtIndex: row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    //    NSLog(@"You selected this: %@", [self.pickerViewData objectAtIndex: row]);
    
       
    [self.pickerView removeFromSuperview];
    
}


- (IBAction)sizeFilterPressed:(id)sender {
}

- (IBAction)colourFilterPressed:(id)sender {
    NSMutableSet * setWithColors = [[NSMutableSet alloc] init];
    
    NSMutableArray * arrayWithColors = [[NSMutableArray alloc] initWithObjects:@"None", nil];
    
    for (MMDItem * item in self.arrayWithSearchResults) {
        if (item.itemColors.count > 0) {
            for (NSString * itemColor in item.itemColors) {
                [setWithColors addObject:itemColor];
            }
        }
    }
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"description" ascending:YES];
    [arrayWithColors addObjectsFromArray:[setWithColors sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]]];
    
            
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
                        //[self populateMapWithData];
                    });
                });
            }
            /*} else {
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
            
       /* } else {
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
        }*/
        

}

- (IBAction)priceFilterPressed:(id)sender {
}

- (IBAction)ascPriceFilterPressed:(id)sender {
}

- (IBAction)refineButtonPressed:(id)sender {
    NSLog(@"in here");
    
   /* UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    prodList = [storyboard instantiateViewControllerWithIdentifier:@"prodListSearchDetails"];
    [prodList initWithArrayWithSearchResults:self.arrayWithSearchResults andTextForSearch:self.searchText];*/
    
}

- (IBAction)locationFilterPressed:(id)sender {
}
@end
