//
//  MMGeographicPlace.h
//  iWeather
//
//  Created by Juan Miguel Marqués Morilla on 4/10/15.
//  Copyright © 2015 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMGeographicPlace : NSObject<NSCoding>

@property (nonatomic,strong) NSString *south;
@property (nonatomic,strong) NSString *east;
@property (nonatomic,strong) NSString *north;
@property (nonatomic,strong) NSString *west;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *lat;
@property (nonatomic,strong) NSString *lng;

-(instancetype)initWithDictionary:(NSDictionary*)dictionary;

-(void)setValuesWithDictionary:(NSDictionary*)dictionary;

@end
