//
//  FavouritesListCollectionView.m
//  MaiaMall
//
//  Created by Ingrid Funie on 23/03/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "FavouritesListCollectionView.h"

@implementation FavouritesListCollectionView

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
    UINib *cellNib = [UINib nibWithNibName:@"ProductCollectionViewCell" bundle:nil];
    [self registerNib:cellNib forCellWithReuseIdentifier:@"PROD_CELL"];
}

@end
