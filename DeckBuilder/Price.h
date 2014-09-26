//
//  Price.h
//
//  Created by   on 9/26/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Price : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double low;
@property (nonatomic, assign) double high;
@property (nonatomic, assign) double median;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
