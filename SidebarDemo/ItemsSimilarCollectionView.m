//
//  ItemsSimilarCollectionView.m
//  MaiaMall
//
//  Created by Ingrid Funie on 25/03/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "ItemsSimilarCollectionView.h"

@implementation ItemsSimilarCollectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (void)registerNibAndCell
{
    UINib *cellNib = [UINib nibWithNibName:@"ItemsSimilarCollectionViewCell" bundle:nil];
    [self registerNib:cellNib forCellWithReuseIdentifier:@"ISIM_CELL"];
}

@end
