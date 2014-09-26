//
//  BaseClass.m
//
//  Created by   on 9/26/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "BaseClass.h"
#import "Formats.h"
#import "Editions.h"


NSString *const kBaseClassId = @"id";
NSString *const kBaseClassFormats = @"formats";
NSString *const kBaseClassCmc = @"cmc";
NSString *const kBaseClassUrl = @"url";
NSString *const kBaseClassEditions = @"editions";
NSString *const kBaseClassColors = @"colors";
NSString *const kBaseClassStoreUrl = @"store_url";
NSString *const kBaseClassPower = @"power";
NSString *const kBaseClassSubtypes = @"subtypes";
NSString *const kBaseClassText = @"text";
NSString *const kBaseClassToughness = @"toughness";
NSString *const kBaseClassTypes = @"types";
NSString *const kBaseClassName = @"name";
NSString *const kBaseClassCost = @"cost";


@interface BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BaseClass

@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize formats = _formats;
@synthesize cmc = _cmc;
@synthesize url = _url;
@synthesize editions = _editions;
@synthesize colors = _colors;
@synthesize storeUrl = _storeUrl;
@synthesize power = _power;
@synthesize subtypes = _subtypes;
@synthesize text = _text;
@synthesize toughness = _toughness;
@synthesize types = _types;
@synthesize name = _name;
@synthesize cost = _cost;


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
            self.internalBaseClassIdentifier = [self objectOrNilForKey:kBaseClassId fromDictionary:dict];
            self.formats = [Formats modelObjectWithDictionary:[dict objectForKey:kBaseClassFormats]];
            self.cmc = [[self objectOrNilForKey:kBaseClassCmc fromDictionary:dict] doubleValue];
            self.url = [self objectOrNilForKey:kBaseClassUrl fromDictionary:dict];
    NSObject *receivedEditions = [dict objectForKey:kBaseClassEditions];
    NSMutableArray *parsedEditions = [NSMutableArray array];
    if ([receivedEditions isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedEditions) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedEditions addObject:[Editions modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedEditions isKindOfClass:[NSDictionary class]]) {
       [parsedEditions addObject:[Editions modelObjectWithDictionary:(NSDictionary *)receivedEditions]];
    }

    self.editions = [NSArray arrayWithArray:parsedEditions];
            self.colors = [self objectOrNilForKey:kBaseClassColors fromDictionary:dict];
            self.storeUrl = [self objectOrNilForKey:kBaseClassStoreUrl fromDictionary:dict];
            self.power = [self objectOrNilForKey:kBaseClassPower fromDictionary:dict];
            self.subtypes = [self objectOrNilForKey:kBaseClassSubtypes fromDictionary:dict];
            self.text = [self objectOrNilForKey:kBaseClassText fromDictionary:dict];
            self.toughness = [self objectOrNilForKey:kBaseClassToughness fromDictionary:dict];
            self.types = [self objectOrNilForKey:kBaseClassTypes fromDictionary:dict];
            self.name = [self objectOrNilForKey:kBaseClassName fromDictionary:dict];
            self.cost = [self objectOrNilForKey:kBaseClassCost fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.internalBaseClassIdentifier forKey:kBaseClassId];
    [mutableDict setValue:[self.formats dictionaryRepresentation] forKey:kBaseClassFormats];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cmc] forKey:kBaseClassCmc];
    [mutableDict setValue:self.url forKey:kBaseClassUrl];
    NSMutableArray *tempArrayForEditions = [NSMutableArray array];
    for (NSObject *subArrayObject in self.editions) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForEditions addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForEditions addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForEditions] forKey:kBaseClassEditions];
    NSMutableArray *tempArrayForColors = [NSMutableArray array];
    for (NSObject *subArrayObject in self.colors) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForColors addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForColors addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForColors] forKey:kBaseClassColors];
    [mutableDict setValue:self.storeUrl forKey:kBaseClassStoreUrl];
    [mutableDict setValue:self.power forKey:kBaseClassPower];
    NSMutableArray *tempArrayForSubtypes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.subtypes) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSubtypes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSubtypes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSubtypes] forKey:kBaseClassSubtypes];
    [mutableDict setValue:self.text forKey:kBaseClassText];
    [mutableDict setValue:self.toughness forKey:kBaseClassToughness];
    NSMutableArray *tempArrayForTypes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.types) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTypes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTypes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTypes] forKey:kBaseClassTypes];
    [mutableDict setValue:self.name forKey:kBaseClassName];
    [mutableDict setValue:self.cost forKey:kBaseClassCost];

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

    self.internalBaseClassIdentifier = [aDecoder decodeObjectForKey:kBaseClassId];
    self.formats = [aDecoder decodeObjectForKey:kBaseClassFormats];
    self.cmc = [aDecoder decodeDoubleForKey:kBaseClassCmc];
    self.url = [aDecoder decodeObjectForKey:kBaseClassUrl];
    self.editions = [aDecoder decodeObjectForKey:kBaseClassEditions];
    self.colors = [aDecoder decodeObjectForKey:kBaseClassColors];
    self.storeUrl = [aDecoder decodeObjectForKey:kBaseClassStoreUrl];
    self.power = [aDecoder decodeObjectForKey:kBaseClassPower];
    self.subtypes = [aDecoder decodeObjectForKey:kBaseClassSubtypes];
    self.text = [aDecoder decodeObjectForKey:kBaseClassText];
    self.toughness = [aDecoder decodeObjectForKey:kBaseClassToughness];
    self.types = [aDecoder decodeObjectForKey:kBaseClassTypes];
    self.name = [aDecoder decodeObjectForKey:kBaseClassName];
    self.cost = [aDecoder decodeObjectForKey:kBaseClassCost];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_internalBaseClassIdentifier forKey:kBaseClassId];
    [aCoder encodeObject:_formats forKey:kBaseClassFormats];
    [aCoder encodeDouble:_cmc forKey:kBaseClassCmc];
    [aCoder encodeObject:_url forKey:kBaseClassUrl];
    [aCoder encodeObject:_editions forKey:kBaseClassEditions];
    [aCoder encodeObject:_colors forKey:kBaseClassColors];
    [aCoder encodeObject:_storeUrl forKey:kBaseClassStoreUrl];
    [aCoder encodeObject:_power forKey:kBaseClassPower];
    [aCoder encodeObject:_subtypes forKey:kBaseClassSubtypes];
    [aCoder encodeObject:_text forKey:kBaseClassText];
    [aCoder encodeObject:_toughness forKey:kBaseClassToughness];
    [aCoder encodeObject:_types forKey:kBaseClassTypes];
    [aCoder encodeObject:_name forKey:kBaseClassName];
    [aCoder encodeObject:_cost forKey:kBaseClassCost];
}

- (id)copyWithZone:(NSZone *)zone
{
    BaseClass *copy = [[BaseClass alloc] init];
    
    if (copy) {

        copy.internalBaseClassIdentifier = [self.internalBaseClassIdentifier copyWithZone:zone];
        copy.formats = [self.formats copyWithZone:zone];
        copy.cmc = self.cmc;
        copy.url = [self.url copyWithZone:zone];
        copy.editions = [self.editions copyWithZone:zone];
        copy.colors = [self.colors copyWithZone:zone];
        copy.storeUrl = [self.storeUrl copyWithZone:zone];
        copy.power = [self.power copyWithZone:zone];
        copy.subtypes = [self.subtypes copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.toughness = [self.toughness copyWithZone:zone];
        copy.types = [self.types copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.cost = [self.cost copyWithZone:zone];
    }
    
    return copy;
}


@end
