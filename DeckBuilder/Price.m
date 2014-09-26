//
//  Price.m
//
//  Created by   on 9/26/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Price.h"


NSString *const kPriceLow = @"low";
NSString *const kPriceHigh = @"high";
NSString *const kPriceMedian = @"median";


@interface Price ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Price

@synthesize low = _low;
@synthesize high = _high;
@synthesize median = _median;


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
            self.low = [[self objectOrNilForKey:kPriceLow fromDictionary:dict] doubleValue];
            self.high = [[self objectOrNilForKey:kPriceHigh fromDictionary:dict] doubleValue];
            self.median = [[self objectOrNilForKey:kPriceMedian fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.low] forKey:kPriceLow];
    [mutableDict setValue:[NSNumber numberWithDouble:self.high] forKey:kPriceHigh];
    [mutableDict setValue:[NSNumber numberWithDouble:self.median] forKey:kPriceMedian];

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

    self.low = [aDecoder decodeDoubleForKey:kPriceLow];
    self.high = [aDecoder decodeDoubleForKey:kPriceHigh];
    self.median = [aDecoder decodeDoubleForKey:kPriceMedian];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_low forKey:kPriceLow];
    [aCoder encodeDouble:_high forKey:kPriceHigh];
    [aCoder encodeDouble:_median forKey:kPriceMedian];
}

- (id)copyWithZone:(NSZone *)zone
{
    Price *copy = [[Price alloc] init];
    
    if (copy) {

        copy.low = self.low;
        copy.high = self.high;
        copy.median = self.median;
    }
    
    return copy;
}


@end
