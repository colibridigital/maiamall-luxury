//
//  FilterMenuController.h
//  MaiaMall
//
//  Created by Ingrid Funie on 01/04/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterMenuController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *locationFilter;
@property (strong, nonatomic) IBOutlet UIButton *sizeFilter;
@property (strong, nonatomic) IBOutlet UIButton *colourFilter;

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
@end