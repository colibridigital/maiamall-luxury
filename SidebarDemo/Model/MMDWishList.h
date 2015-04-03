//
//  MMDWishList.h
//  MaiaMall Demo
//
//  Created by Illya Bakurov on 3/19/15.
//  Copyright (c) 2015 MaiaMall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DefineKeys.h"
#import "MMDItem.h"

@interface MMDWishList : NSObject

@property (strong, nonatomic, readonly) NSMutableArray * wishList;

+(id)sharedInstance;

- (void)addItemToWishList:(MMDItem*)item;
- (void)removeItemFromWishListAtObjectIndex:(NSUInteger)index;

@end
