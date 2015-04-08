//
//  WishlistTableViewCell.m
//  MaiaMall
//
//  Created by Ingrid Funie on 04/04/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "WishlistTableViewCell.h"

@interface WishlistTableViewCell()

@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *storeTitle;
@property (strong, nonatomic) IBOutlet UILabel *itemTitle;
@property (strong, nonatomic) IBOutlet UILabel *price;

@end

@implementation WishlistTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)initWithItem:(MMDItem*)item {
    NSString *imagePath = item.itemImagePath;
    UIImage *itemImage = [UIImage imageWithContentsOfFile:imagePath];
    
    if (itemImage != nil) {
        float oldWidth = itemImage.size.width;
        float scaleFactor = self.image.frame.size.width / oldWidth;
        
        float newHeight = itemImage.size.height * scaleFactor;
        float newWidth = oldWidth * scaleFactor;
        
        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
        [itemImage drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        [self.image setImage:newImage];
    }
    [self.storeTitle setText:item.itemStore.storeTitle];
    [self.itemTitle setText:item.itemTitle];
    [self.price setText:[NSString stringWithFormat:@"£%.2f", item.itemPrice]];
}

@end

