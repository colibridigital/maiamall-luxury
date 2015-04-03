//
//  MMDStore.m
//  MaiaMall Demo
//
//  Created by Illya Bakurov on 3/19/15.
//  Copyright (c) 2015 MaiaMall. All rights reserved.
//

#import "MMDStore.h"

@interface MMDStore() <NSCoding>

@property (strong, nonatomic, readwrite) NSString * storeId;
@property (strong, nonatomic, readwrite) NSString * storeTitle;
@property (strong, nonatomic, readwrite) NSString * storeDescription;
@property (strong, nonatomic, readwrite) UIImage * storeLogo;
@property (nonatomic, readwrite) CLLocationDegrees storeLatitude;
@property (nonatomic, readwrite) CLLocationDegrees storeLongitude;

@end

@implementation MMDStore

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.storeId forKey:kStoreId];
    [aCoder encodeObject:self.storeTitle forKey:kStoreTitle];
    [aCoder encodeObject:self.storeDescription forKey:kStoreDescription];
    NSData* imageData = UIImageJPEGRepresentation(self.storeLogo, 1.0);
    [aCoder encodeObject:imageData forKey:kStoreLogo];
    [aCoder encodeDouble:self.storeLatitude forKey:kStoreLatitude];
    [aCoder encodeDouble:self.storeLongitude forKey:kStoreLongitude];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self.storeId = [aDecoder decodeObjectForKey:kStoreId];
    self.storeTitle = [aDecoder decodeObjectForKey:kStoreTitle];
    self.storeDescription = [aDecoder decodeObjectForKey:kStoreDescription];
    NSData* myEncodedImageData = [aDecoder decodeObjectForKey:kStoreLogo];
    self.storeLogo = [UIImage imageWithData:myEncodedImageData];
    self.storeLatitude = [aDecoder decodeDoubleForKey:kStoreLatitude];
    self.storeLongitude = [aDecoder decodeDoubleForKey:kStoreLongitude];

    return self;
}

- (instancetype)initWithId:(NSString*)storeId title:(NSString*)storeTitle description:(NSString*)storeDescription logo:(UIImage*)storeLogo latitude:(CLLocationDegrees)storeLatitude longitude:(CLLocationDegrees)storeLongitude {
    self.storeId = storeId;
    self.storeTitle = storeTitle;
    self.storeDescription = storeDescription;
    self.storeLogo = storeLogo;
    self.storeLatitude = storeLatitude;
    self.storeLongitude = storeLongitude;
    
    return self;
}

- (instancetype)initWithStore:(MMDStore*)store {
    self.storeId = store.storeId;
    self.storeTitle = store.storeTitle;
    self.storeDescription = store.storeDescription;
    self.storeLogo = store.storeLogo;
    self.storeLatitude = store.storeLatitude;
    self.storeLongitude = store.storeLongitude;
    
    return self;
}

@end
