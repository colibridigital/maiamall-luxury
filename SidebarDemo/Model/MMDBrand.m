//
//  MMDBrand.m
//  MaiaMall Demo
//
//  Created by Illya Bakurov on 3/23/15.
//  Copyright (c) 2015 MaiaMall. All rights reserved.
//

#import "MMDBrand.h"
#import "DefineKeys.h"

@interface MMDBrand() <NSCoding>

@property (strong, nonatomic, readwrite) NSString * brandId;
@property (strong, nonatomic, readwrite) NSString * brandTitle;
@property (strong, nonatomic, readwrite) UIImage * brandImage;

@end

@implementation MMDBrand

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.brandId forKey:kBrandId];
    [aCoder encodeObject:self.brandTitle forKey:kBrandTitle];
    NSData* imageData = UIImageJPEGRepresentation(self.brandImage, 1.0);
    [aCoder encodeObject:imageData forKey:kBrandImage];}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self.brandId = [aDecoder decodeObjectForKey:kBrandId];
    self.brandTitle = [aDecoder decodeObjectForKey:kBrandTitle];
    NSData* myEncodedImageData = [aDecoder decodeObjectForKey:kBrandImage];
    self.brandImage = [UIImage imageWithData:myEncodedImageData];
    
    return self;
}

- (instancetype)initWithId:(NSString*)brandId title:(NSString*)brandTitle image:(UIImage*)brandImage {
    self.brandId = brandId;
    self.brandTitle = brandTitle;
    self.brandImage = brandImage;
    
    return self;
}

- (instancetype)initWithBrand:(MMDBrand*)brand {
    self.brandId = brand.brandId;
    self.brandTitle = brand.brandTitle;
    self.brandImage = brand.brandImage;
    
    return self;
}

@end
