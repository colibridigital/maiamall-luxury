//
//  MMDBrand.h
//  MaiaMall Demo
//
//  Created by Illya Bakurov on 3/23/15.
//  Copyright (c) 2015 MaiaMall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MMDBrand : NSObject

@property (strong, nonatomic, readonly) NSString * brandId;
@property (strong, nonatomic, readonly) NSString * brandTitle;
@property (strong, nonatomic, readonly) UIImage * brandImage;

- (instancetype)initWithId:(NSString*)brandId title:(NSString*)brandTitle image:(UIImage*)brandImage;
- (instancetype)initWithBrand:(MMDBrand*)brand;

@end
