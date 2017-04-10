//
//  GeographicModuleItem.m
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "GeographicModuleItem.h"

@implementation AlternativeName

@end

@implementation BBox

@end

@implementation Timezone

@end

@implementation Geoname

- (void)getGeonameFromGeographicModuleSearchedItem:(GeographicModuleSearchedItem*)geographicModuleSearchedItem{
    BBox *bbox = [[BBox alloc]init];
    bbox.north = geographicModuleSearchedItem.north;
    bbox.south = geographicModuleSearchedItem.south;
    bbox.west = geographicModuleSearchedItem.west;
    bbox.east = geographicModuleSearchedItem.east;
    self.bbox = bbox;
    self.name = geographicModuleSearchedItem.name;
    self.geonameId =  geographicModuleSearchedItem.geonameId;
    self.lat = geographicModuleSearchedItem.lat;
    self.lng = geographicModuleSearchedItem.lng;
    self.population = geographicModuleSearchedItem.population;
}


@end

@implementation GeographicModuleItem

@end
