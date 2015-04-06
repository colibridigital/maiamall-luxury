//
//  ItemsInTheStoreTableViewCell.h
//  MaiaMall
//
//  Created by Ingrid Funie on 06/04/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DefineKeys.h"
#import "MMDItem.h"

@interface ItemsInTheStoreTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *itemTitle;


- (void)initCellWithDictionary:(NSMutableDictionary*)dict;
@end
