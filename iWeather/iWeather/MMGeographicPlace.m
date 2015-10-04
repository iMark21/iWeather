//
//  MMGeographicPlace.m
//  iWeather
//
//  Created by Juan Miguel Marqués Morilla on 4/10/15.
//  Copyright © 2015 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "MMGeographicPlace.h"

@implementation MMGeographicPlace


-(instancetype)initWithDictionary:(NSDictionary*)dictionary{
    
    
    if (self = [super init]) {
        
        [self setValuesWithDictionary:dictionary];
        
    }
    
    return self;
}

-(void)setValuesWithDictionary:(NSDictionary*)dictionary{
    
    self.south = [dictionary valueForKeyPath:@"bbox.south"];
    self.north = [dictionary valueForKeyPath:@"bbox.north"];
    self.east = [dictionary valueForKeyPath:@"bbox.east"];
    self.west = [dictionary valueForKeyPath:@"bbox.west"];
    self.name = [dictionary valueForKey:@"name"];
    self.lat = [dictionary valueForKey:@"lat"];
    self.lng = [dictionary valueForKey:@"lng"];

}


@end
