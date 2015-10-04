//
//  MMGeographicPlace.m
//  iWeather
//
//  Created by Juan Miguel Marqués Morilla on 4/10/15.
//  Copyright © 2015 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "MMGeographicPlace.h"

@implementation MMGeographicPlace


- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.south = [decoder decodeObjectForKey:@"south"];
        self.north = [decoder decodeObjectForKey:@"north"];
        self.east = [decoder decodeObjectForKey:@"east"];
        self.west = [decoder decodeObjectForKey:@"west"];
        self.lat = [decoder decodeObjectForKey:@"lat"];
        self.lng = [decoder decodeObjectForKey:@"lng"];
        self.name = [decoder decodeObjectForKey:@"name"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_south forKey:@"south"];
    [encoder encodeObject:_north forKey:@"north"];
    [encoder encodeObject:_east forKey:@"east"];
    [encoder encodeObject:_west forKey:@"west"];
    [encoder encodeObject:_lat forKey:@"lat"];
    [encoder encodeObject:_lng forKey:@"lng"];
    [encoder encodeObject:_name forKey:@"name"];
}

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
