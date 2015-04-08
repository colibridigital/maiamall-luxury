//
//  PurchaseItemTableViewCell.m
//  MaiaMall
//
//  Created by Ingrid Funie on 06/04/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "PurchaseItemTableViewCell.h"


@implementation PurchaseItemTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)initCellWithItem:(MMDItem*)item {
    NSString *imagePath = item.itemImagePath;
    UIImage *itemImage = [UIImage imageWithContentsOfFile:imagePath];
    
    if (item.itemImage != nil) {
        float oldWidth = itemImage.size.width;
        float scaleFactor = self.image.frame.size.width / oldWidth;
        
        float newHeight = itemImage.size.height * scaleFactor;
        float newWidth = oldWidth * scaleFactor;
        
        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
        [itemImage drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        self.image.image = newImage;
    }
    
    self.storeTitle.text = item.itemStore.storeTitle;
    self.itemTitle.text = item.itemTitle;
    self.itemNumberInCart.text = [NSString stringWithFormat:@"%i", item.itemNumberInCart];
}


- (void)setTextFieldTextFornumber:(int)number {
    self.itemNumberInCart.text = [NSString stringWithFormat:@"%i", number];
}

- (void)initTotalPrice:(float)totalPrice {
    self.totalPrice.text = [NSString stringWithFormat:@"£ %.2f", totalPrice];
}

@end
