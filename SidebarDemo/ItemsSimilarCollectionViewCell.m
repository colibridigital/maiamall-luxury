//
//  ItemsSimilarCollectionViewCell.m
//  MaiaMall
//
//  Created by Ingrid Funie on 25/03/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "ItemsSimilarCollectionViewCell.h"

@implementation ItemsSimilarCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(id)init {
    
    self = [super init];
    
    UIImage *img = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"product2" ofType: @"png"]];
    
    self.detailImage = [[UIImageView alloc] initWithImage:img];
    
    return self;
    
}

- (void)initWithDictionary:(NSDictionary*)dictionary {
    
    if ([dictionary objectForKey:kItemImage] != nil) {
        UIImage* newImage = [self makeImageLookNice:[dictionary objectForKey:kItemImage]];
        if (newImage != nil) {
            self.detailImage.image = newImage;
            
        }
    }
    
    NSLog(@"the distance is %@", [dictionary objectForKey:@"distance"]);
    
    //self.distanceToUser.text = [dictionary objectForKey:@"distance"];
    
    if ([dictionary objectForKey:kStoreLogo] != nil) {
      
        self.shopName.image = [dictionary objectForKey:kStoreLogo];
        
    }
    
    //self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    //self.layer.shouldRasterize = YES;
}

- (UIImage*)makeImageLookNice:(UIImage*)image{
    if (image != nil) {
        float oldWidth = image.size.width;
        float scaleFactor = self.detailImage.frame.size.width / oldWidth;
        
        float newHeight = image.size.height * scaleFactor;
        float newWidth = oldWidth * scaleFactor;
        
        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
        [image drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return newImage;
    }
    
    return nil;
}

@end
