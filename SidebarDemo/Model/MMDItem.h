//
//  MMDItem.h
//  MaiaMall Demo
//
//  Created by Illya Bakurov on 3/19/15.
//  Copyright (c) 2015 MaiaMall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MMDBrand.h"
#import "DefineKeys.h"
#import "MMDCart.h"
#import "MMDDataBase.h"
#import "MMDOffer.h"
#import "MMDStore.h"

typedef enum {
    female = 0,
    male = 1
}kGender;

@interface MMDItem : NSObject

@property (strong, nonatomic, readonly) NSString * itemId;
@property (strong, nonatomic, readonly) NSString * itemTitle;
@property (strong, nonatomic, readonly) NSString * itemDescription;
@property (strong, nonatomic, readonly) UIImage * itemImage;
@property (nonatomic, readonly) BOOL hasDefaultImage;
@property (strong, nonatomic, readonly) NSString * itemSKU;
@property (strong, nonatomic, readonly) NSString * itemCollection;
@property (strong, nonatomic, readonly) NSString * itemCategory;
@property (strong, nonatomic, readonly) NSMutableArray * itemColors;
@property (strong, nonatomic, readonly) NSMutableArray * itemSizes;
@property (strong, nonatomic, readonly) MMDStore * itemStore;
@property (strong, nonatomic, readonly) MMDBrand* itemBrand;
@property (nonatomic, readonly) float itemPrice;
@property (nonatomic, readonly) BOOL itemIsInWishList;
@property (nonatomic, readonly) kGender itemGender;
@property (nonatomic, readonly) int itemNumberInCart;
@property (strong, nonatomic, readonly) NSMutableArray * itemOffers; //array of MMDOffers


- (instancetype)initWithId:(NSString*)itemId title:(NSString*)itemTitle description:(NSString*)itemDescription image:(UIImage*)itemImage SKU:(NSString*)itemSKU collection:(NSString*)itemCollection category:(NSString*)itemCategory price:(float)itemPrice store:(MMDStore*)itemStore brand:(MMDBrand*)itemBrand gender:(kGender)itemGender color:(NSMutableArray*)itemColors size:(NSMutableArray*)itemSizes;
- (instancetype)initWithItem:(MMDItem*)item;

- (void)addItemToCart; //addes 1 item to cart
- (void)removeItemFromCart; //removes 1 item from cart
- (void)annulateItemInCart; //removes all items in the cart;
- (void)setItemIsInWishList:(BOOL)isInWishList;

- (void)addOffer:(MMDOffer*)offer;
- (void)removeOffer:(MMDOffer*)offer;
@end
