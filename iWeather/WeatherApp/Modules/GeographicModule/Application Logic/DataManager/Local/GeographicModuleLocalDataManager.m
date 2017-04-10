//
//  GeographicModuleLocalDataManager.m
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "GeographicModuleLocalDataManager.h"
#import "GeographicModuleSearchedItem.h"
#import <Realm/Realm.h>

@implementation GeographicModuleLocalDataManager

- (instancetype)init {
    self = [super init];
    if (self) {
        // perform initialization
    }
    return self;
}

#pragma mark - retrieve methods

- (void)requestGeographicStoredPlacesCompletion:(GeographicModuleCompletionBlock)completion{
    NSMutableArray *geonames = [[NSMutableArray alloc]init];
    RLMResults<GeographicModuleSearchedItem *> *geographicModuleStoredItemResults = [GeographicModuleSearchedItem allObjects];
    if (geographicModuleStoredItemResults.count >0) {
        for (GeographicModuleSearchedItem *geographicStoredItem in geographicModuleStoredItemResults) {
            Geoname *geoname = [[Geoname alloc]init];
            [geoname getGeonameFromGeographicModuleSearchedItem:geographicStoredItem];
            [geonames addObject:geoname];
        }
    }
    completion ([NSArray arrayWithArray:geonames],false);
}

#pragma mark - store methods

- (void)storeGeonameItem:(Geoname*)geoname{
    RLMRealm *realm = [RLMRealm defaultRealm];
    GeographicModuleSearchedItem *geographicModuleSearchedItem = [[GeographicModuleSearchedItem alloc] init];
    geographicModuleSearchedItem.north =  geoname.bbox.north;
    geographicModuleSearchedItem.south =  geoname.bbox.south;
    geographicModuleSearchedItem.west =  geoname.bbox.west;
    geographicModuleSearchedItem.east =  geoname.bbox.east;
    geographicModuleSearchedItem.name =  geoname.name;
    geographicModuleSearchedItem.geonameId = geoname.geonameId;
    geographicModuleSearchedItem.lat = geoname.lat;
    geographicModuleSearchedItem.lng = geoname.lng;
    geographicModuleSearchedItem.population = geoname.population;
    [realm transactionWithBlock:^{
        [realm addOrUpdateObject:geographicModuleSearchedItem];
    }];
}

@end
