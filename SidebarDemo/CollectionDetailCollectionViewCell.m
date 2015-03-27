//
//  CollectionDetailCollectionViewCell.m
//  MaiaMall
//
//  Created by Ingrid Funie on 27/03/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "CollectionDetailCollectionViewCell.h"

@implementation CollectionDetailCollectionViewCell

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
    
    UIImage *img = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"blouse" ofType: @"png"]];
    
    self.detailImage = [[UIImageView alloc] initWithImage:img];
    
    return self;
    
}

@end
