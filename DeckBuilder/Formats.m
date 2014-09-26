//
//  Formats.m
//
//  Created by   on 9/26/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Formats.h"


NSString *const kFormatsCommander = @"commander";
NSString *const kFormatsLegacy = @"legacy";
NSString *const kFormatsVintage = @"vintage";


@interface Formats ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Formats

@synthesize commander = _commander;
@synthesize legacy = _legacy;
@synthesize vintage = _vintage;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.commander = [self objectOrNilForKey:kFormatsCommander fromDictionary:dict];
            self.legacy = [self objectOrNilForKey:kFormatsLegacy fromDictionary:dict];
            self.vintage = [self objectOrNilForKey:kFormatsVintage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.commander forKey:kFormatsCommander];
    [mutableDict setValue:self.legacy forKey:kFormatsLegacy];
    [mutableDict setValue:self.vintage forKey:kFormatsVintage];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.commander = [aDecoder decodeObjectForKey:kFormatsCommander];
    self.legacy = [aDecoder decodeObjectForKey:kFormatsLegacy];
    self.vintage = [aDecoder decodeObjectForKey:kFormatsVintage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_commander forKey:kFormatsCommander];
    [aCoder encodeObject:_legacy forKey:kFormatsLegacy];
    [aCoder encodeObject:_vintage forKey:kFormatsVintage];
}

- (id)copyWithZone:(NSZone *)zone
{
    Formats *copy = [[Formats alloc] init];
    
    if (copy) {

        copy.commander = [self.commander copyWithZone:zone];
        copy.legacy = [self.legacy copyWithZone:zone];
        copy.vintage = [self.vintage copyWithZone:zone];
    }
    
    return copy;
}


@end
