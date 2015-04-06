//
//  PurchaseItemTableViewCell.h
//  MaiaMall
//
//  Created by Ingrid Funie on 06/04/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMDItem.h"

@interface PurchaseItemTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *storeTitle;
//@property (strong, nonatomic) IBOutlet UILabel *itemSize;
@property (strong, nonatomic) IBOutlet UILabel *itemTitle;
@property (strong, nonatomic) IBOutlet UITextField *itemNumberInCart;
@property (strong, nonatomic) IBOutlet UILabel *totalPrice;

- (void)initCellWithItem:(MMDItem*)item;
- (void)initTotalPrice:(float)totalPrice;
- (void)setTextFieldTextFornumber:(int)number;

@end
