//
//  Editions.h
//
//  Created by   on 9/26/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Price;

@interface Editions : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *flavor;
@property (nonatomic, strong) NSString *layout;
@property (nonatomic, assign) double multiverseId;
@property (nonatomic, strong) NSString *rarity;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *storeUrl;
@property (nonatomic, strong) Price *price;
@property (nonatomic, strong) NSString *set;
@property (nonatomic, strong) NSString *setId;
@property (nonatomic, strong) NSString *number;
@property (nonatomic, strong) NSString *artist;
@property (nonatomic, strong) NSString *setUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
