//
//  MMDOffer.h
//  MaiaMall Demo
//
//  Created by Illya Bakurov on 3/20/15.
//  Copyright (c) 2015 MaiaMall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DefineKeys.h"

@class MMDItem;

@interface MMDOffer : NSObject

@property (strong, nonatomic, readonly) NSString * offerId;
@property (strong, nonatomic, readonly) NSString * offerTitle;
@property (strong, nonatomic, readonly) NSString * offerDescription;
@property (strong, nonatomic, readonly) NSMutableArray * offerItems; //array of MMDItems

- (instancetype)initWithId:(NSString*)offerId title:(NSString*)offerTitle description:(NSString*)offerDescription;
- (instancetype)initWithOffer:(MMDOffer*)offer;

- (void)addItem:(MMDItem*)item;
- (void)removeItem:(MMDItem*)item;

@end
