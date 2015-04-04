//
//  WishlistTableViewCell.h
//  MaiaMall
//
//  Created by Ingrid Funie on 04/04/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMDItem.h"
#import "MMDStore.h"

@interface WishlistTableViewCell : UITableViewCell
- (void)initWithItem:(MMDItem*)item;
@end
