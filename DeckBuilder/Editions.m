//
//  Editions.m
//
//  Created by   on 9/26/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Editions.h"
#import "Price.h"


NSString *const kEditionsFlavor = @"flavor";
NSString *const kEditionsLayout = @"layout";
NSString *const kEditionsMultiverseId = @"multiverse_id";
NSString *const kEditionsRarity = @"rarity";
NSString *const kEditionsImageUrl = @"image_url";
NSString *const kEditionsUrl = @"url";
NSString *const kEditionsStoreUrl = @"store_url";
NSString *const kEditionsPrice = @"price";
NSString *const kEditionsSet = @"set";
NSString *const kEditionsSetId = @"set_id";
NSString *const kEditionsNumber = @"number";
NSString *const kEditionsArtist = @"artist";
NSString *const kEditionsSetUrl = @"set_url";


@interface Editions ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Editions

@synthesize flavor = _flavor;
@synthesize layout = _layout;
@synthesize multiverseId = _multiverseId;
@synthesize rarity = _rarity;
@synthesize imageUrl = _imageUrl;
@synthesize url = _url;
@synthesize storeUrl = _storeUrl;
@synthesize price = _price;
@synthesize set = _set;
@synthesize setId = _setId;
@synthesize number = _number;
@synthesize artist = _artist;
@synthesize setUrl = _setUrl;


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
            self.flavor = [self objectOrNilForKey:kEditionsFlavor fromDictionary:dict];
            self.layout = [self objectOrNilForKey:kEditionsLayout fromDictionary:dict];
            self.multiverseId = [[self objectOrNilForKey:kEditionsMultiverseId fromDictionary:dict] doubleValue];
            self.rarity = [self objectOrNilForKey:kEditionsRarity fromDictionary:dict];
            self.imageUrl = [self objectOrNilForKey:kEditionsImageUrl fromDictionary:dict];
            self.url = [self objectOrNilForKey:kEditionsUrl fromDictionary:dict];
            self.storeUrl = [self objectOrNilForKey:kEditionsStoreUrl fromDictionary:dict];
            self.price = [Price modelObjectWithDictionary:[dict objectForKey:kEditionsPrice]];
            self.set = [self objectOrNilForKey:kEditionsSet fromDictionary:dict];
            self.setId = [self objectOrNilForKey:kEditionsSetId fromDictionary:dict];
            self.number = [self objectOrNilForKey:kEditionsNumber fromDictionary:dict];
            self.artist = [self objectOrNilForKey:kEditionsArtist fromDictionary:dict];
            self.setUrl = [self objectOrNilForKey:kEditionsSetUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.flavor forKey:kEditionsFlavor];
    [mutableDict setValue:self.layout forKey:kEditionsLayout];
    [mutableDict setValue:[NSNumber numberWithDouble:self.multiverseId] forKey:kEditionsMultiverseId];
    [mutableDict setValue:self.rarity forKey:kEditionsRarity];
    [mutableDict setValue:self.imageUrl forKey:kEditionsImageUrl];
    [mutableDict setValue:self.url forKey:kEditionsUrl];
    [mutableDict setValue:self.storeUrl forKey:kEditionsStoreUrl];
    [mutableDict setValue:[self.price dictionaryRepresentation] forKey:kEditionsPrice];
    [mutableDict setValue:self.set forKey:kEditionsSet];
    [mutableDict setValue:self.setId forKey:kEditionsSetId];
    [mutableDict setValue:self.number forKey:kEditionsNumber];
    [mutableDict setValue:self.artist forKey:kEditionsArtist];
    [mutableDict setValue:self.setUrl forKey:kEditionsSetUrl];

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

    self.flavor = [aDecoder decodeObjectForKey:kEditionsFlavor];
    self.layout = [aDecoder decodeObjectForKey:kEditionsLayout];
    self.multiverseId = [aDecoder decodeDoubleForKey:kEditionsMultiverseId];
    self.rarity = [aDecoder decodeObjectForKey:kEditionsRarity];
    self.imageUrl = [aDecoder decodeObjectForKey:kEditionsImageUrl];
    self.url = [aDecoder decodeObjectForKey:kEditionsUrl];
    self.storeUrl = [aDecoder decodeObjectForKey:kEditionsStoreUrl];
    self.price = [aDecoder decodeObjectForKey:kEditionsPrice];
    self.set = [aDecoder decodeObjectForKey:kEditionsSet];
    self.setId = [aDecoder decodeObjectForKey:kEditionsSetId];
    self.number = [aDecoder decodeObjectForKey:kEditionsNumber];
    self.artist = [aDecoder decodeObjectForKey:kEditionsArtist];
    self.setUrl = [aDecoder decodeObjectForKey:kEditionsSetUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_flavor forKey:kEditionsFlavor];
    [aCoder encodeObject:_layout forKey:kEditionsLayout];
    [aCoder encodeDouble:_multiverseId forKey:kEditionsMultiverseId];
    [aCoder encodeObject:_rarity forKey:kEditionsRarity];
    [aCoder encodeObject:_imageUrl forKey:kEditionsImageUrl];
    [aCoder encodeObject:_url forKey:kEditionsUrl];
    [aCoder encodeObject:_storeUrl forKey:kEditionsStoreUrl];
    [aCoder encodeObject:_price forKey:kEditionsPrice];
    [aCoder encodeObject:_set forKey:kEditionsSet];
    [aCoder encodeObject:_setId forKey:kEditionsSetId];
    [aCoder encodeObject:_number forKey:kEditionsNumber];
    [aCoder encodeObject:_artist forKey:kEditionsArtist];
    [aCoder encodeObject:_setUrl forKey:kEditionsSetUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    Editions *copy = [[Editions alloc] init];
    
    if (copy) {

        copy.flavor = [self.flavor copyWithZone:zone];
        copy.layout = [self.layout copyWithZone:zone];
        copy.multiverseId = self.multiverseId;
        copy.rarity = [self.rarity copyWithZone:zone];
        copy.imageUrl = [self.imageUrl copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.storeUrl = [self.storeUrl copyWithZone:zone];
        copy.price = [self.price copyWithZone:zone];
        copy.set = [self.set copyWithZone:zone];
        copy.setId = [self.setId copyWithZone:zone];
        copy.number = [self.number copyWithZone:zone];
        copy.artist = [self.artist copyWithZone:zone];
        copy.setUrl = [self.setUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
