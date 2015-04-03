//
//  MMDCart.h
//  MaiaMall Demo
//
//  Created by Illya Bakurov on 3/25/15.
//  Copyright (c) 2015 MaiaMall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DefineKeys.h"
#import "MMDItem.h"

@interface MMDCart : NSObject <NSCoding>

@property (strong, nonatomic) NSMutableArray * arrayWithItemsToPurchase;

+ (id)cart;
- (void)saveCartIntoDefaults;
- (void)cartWasPurchased;

@end
