//
//  MMDStore.h
//  MaiaMall Demo
//
//  Created by Illya Bakurov on 3/19/15.
//  Copyright (c) 2015 MaiaMall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "DefineKeys.h"

@interface MMDStore : NSObject

@property (strong, nonatomic, readonly) NSString * storeId;
@property (strong, nonatomic, readonly) NSString * storeTitle;
@property (strong, nonatomic, readonly) NSString * storeDescription;
@property (strong, nonatomic, readonly) UIImage * storeLogo;
@property (nonatomic, readonly) CLLocationDegrees storeLatitude;
@property (nonatomic, readonly) CLLocationDegrees storeLongitude;

- (instancetype)initWithId:(NSString*)storeId title:(NSString*)storeTitle description:(NSString*)storeDescription logo:(UIImage*)storeLogo latitude:(CLLocationDegrees)storeLatitude longitude:(CLLocationDegrees)storeLongitude;
- (instancetype)initWithStore:(MMDStore*)store;

@end
