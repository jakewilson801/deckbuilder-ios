//
//  BaseClass.h
//
//  Created by   on 9/26/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Formats;

@interface BaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *internalBaseClassIdentifier;
@property (nonatomic, strong) Formats *formats;
@property (nonatomic, assign) double cmc;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSArray *editions;
@property (nonatomic, strong) NSArray *colors;
@property (nonatomic, strong) NSString *storeUrl;
@property (nonatomic, strong) NSString *power;
@property (nonatomic, strong) NSArray *subtypes;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *toughness;
@property (nonatomic, strong) NSArray *types;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *cost;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
