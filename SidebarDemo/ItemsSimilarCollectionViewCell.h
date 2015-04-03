//
//  ItemsSimilarCollectionViewCell.h
//  MaiaMall
//
//  Created by Ingrid Funie on 25/03/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DefineKeys.h"

@interface ItemsSimilarCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *shopName;
@property (strong, nonatomic) IBOutlet UILabel *distanceToUser;
@property (strong, nonatomic) IBOutlet UIImageView *detailImage;

- (void)initWithDictionary:(NSDictionary*)dictionary;


@end
