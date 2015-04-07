//
//  FilterMenuController.h
//  MaiaMall
//
//  Created by Ingrid Funie on 01/04/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMDItem.h"
#import "MBProgressHUD.h"
#import "ProductListViewController.h"
#import "MapViewController.h"


@interface FilterMenuController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIButton *locationFilter;
@property (strong, nonatomic) IBOutlet UIButton *sizeFilter;
@property (strong, nonatomic) IBOutlet UIButton *colourFilter;

@property (strong, nonatomic) NSMutableArray * arrayWithSearchResults; //array of MMDItems
@property (strong, nonatomic) NSMutableArray * arrayWithSearchResultsBeforeFiltering;
@property (strong, nonatomic) NSString * searchText;
@property (strong, nonatomic) NSMutableArray * arrayWithColors;
@property (strong, nonatomic) NSMutableArray * arrayWithSize;
@property (strong, nonatomic) NSMutableArray * pickerViewData;

- (IBAction)sizeFilterPressed:(id)sender;

- (IBAction)colourFilterPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *priceFilter;
- (IBAction)priceFilterPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *ascPriceFilter;
@property (strong, nonatomic) IBOutlet UIButton *descPriceFilter;
- (IBAction)ascPriceFilterPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *descPriceFilterPressed;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;
- (IBAction)refineButtonPressed:(id)sender;

- (IBAction)locationFilterPressed:(id)sender;

@property(strong, nonatomic) ProductListViewController *prodList;
@property(strong, nonatomic) MapViewController *map;

- (void)initWithArrayWithSearchResults:(NSMutableArray*)array andTextForSearch:(NSString*)searchText;

@property (strong, nonatomic) NSString * keyForColorFilter;
@property (strong, nonatomic) NSString * keyForSizeFilter;

@property (nonatomic) BOOL isInMapView;

@end
