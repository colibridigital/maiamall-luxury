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

@end
