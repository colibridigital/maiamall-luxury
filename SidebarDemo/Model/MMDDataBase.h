//
//  MMDDataBase.h
//  MaiaMall Demo
//
//  Created by Illya Bakurov on 3/19/15.
//  Copyright (c) 2015 MaiaMall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface MMDDataBase : NSObject <NSCoding> {
    sqlite3 * dataBase;
}

@property (strong, nonatomic) NSMutableArray * arrayWithItems;
@property (strong, nonatomic) NSMutableArray * arrayWithOffers;

+ (id)database;
- (void)saveDataBase;
- (void)initDatabase;
- (void)closeDataBase;
- (NSMutableArray *)getSummerCollectionItems;
- (NSMutableArray *)getShoesCollection;
- (NSMutableArray *)getBagsCollection;
- (NSMutableArray *)getShirtsCollection;
- (NSMutableArray *)getFormalCollection;
- (NSMutableArray *)getFavouriteCollection;
@end
