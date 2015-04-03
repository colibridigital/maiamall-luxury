//
//  MMDOffer.m
//  MaiaMall Demo
//
//  Created by Illya Bakurov on 3/20/15.
//  Copyright (c) 2015 MaiaMall. All rights reserved.
//

#import "MMDOffer.h"

@interface MMDOffer() <NSCoding>

@property (strong, nonatomic, readwrite) NSString * offerId;
@property (strong, nonatomic, readwrite) NSString * offerTitle;
@property (strong, nonatomic, readwrite) NSString * offerDescription;
@property (strong, nonatomic, readwrite) NSMutableArray * offerItems; //array of MMDItems

@end

@implementation MMDOffer

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.offerId forKey:kOfferId];
    [aCoder encodeObject:self.offerTitle forKey:kOfferTitle];
    [aCoder encodeObject:self.offerDescription forKey:kOfferDescription];
    [aCoder encodeObject:self.offerItems forKey:kOfferItems];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self.offerId = [aDecoder decodeObjectForKey:kOfferId];
    self.offerTitle = [aDecoder decodeObjectForKey:kOfferTitle];
    self.offerDescription = [aDecoder decodeObjectForKey:kOfferDescription];
    if ([aDecoder decodeObjectForKey:kOfferItems]) {
        self.offerItems = [[NSMutableArray alloc] initWithArray:[aDecoder decodeObjectForKey:kOfferItems]];
    } else {
        self.offerItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (instancetype)initWithId:(NSString*)offerId title:(NSString*)offerTitle description:(NSString*)offerDescription {
    self.offerId = offerId;
    self.offerTitle = offerTitle;
    self.offerDescription = offerDescription;
    self.offerItems = [[NSMutableArray alloc] init];
    
    return self;
}

- (instancetype)initWithOffer:(MMDOffer*)offer {
    self.offerId = offer.offerId;
    self.offerTitle = offer.offerTitle;
    self.offerDescription = offer.offerDescription;
    self.offerItems = [[NSMutableArray alloc] initWithArray:offer.offerItems];
    
    return self;
}

- (void)addItem:(MMDItem*)item {
    [self.offerItems addObject:item];
}

- (void)removeItem:(MMDItem*)item {
    [self.offerItems removeObject:item];
}

@end
