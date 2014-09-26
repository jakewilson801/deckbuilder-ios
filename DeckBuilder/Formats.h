//
//  Formats.h
//
//  Created by   on 9/26/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Formats : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *commander;
@property (nonatomic, strong) NSString *legacy;
@property (nonatomic, strong) NSString *vintage;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
