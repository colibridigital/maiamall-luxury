//
//  ItemsInTheStoreTableViewCell.m
//  MaiaMall
//
//  Created by Ingrid Funie on 06/04/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "ItemsInTheStoreTableViewCell.h"

@implementation ItemsInTheStoreTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)initCellWithDictionary:(NSMutableDictionary *)dict {
    
    MMDItem * item = [dict objectForKey:kItem];
    
    if (item.itemImage != nil) {
        float oldWidth = item.itemImage.size.width;
        float scaleFactor = self.image.frame.size.width / oldWidth;
        
        float newHeight = item.itemImage.size.height * scaleFactor;
        float newWidth = oldWidth * scaleFactor;
        
        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
        [item.itemImage drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        [self.image setImage:newImage];
    }
    
    self.itemTitle.text = item.itemTitle;
}


@end
