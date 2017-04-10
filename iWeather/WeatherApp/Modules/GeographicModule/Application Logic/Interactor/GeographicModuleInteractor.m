//
//  GeographicModuleInteractor.m
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "GeographicModuleInteractor.h"

@implementation GeographicModuleInteractor

- (void)requestGeographicPlacesWithQuery:(NSString*)queryString{
    __weak typeof(self) weakSelf = self;
    if (queryString.length==0 || queryString == nil) {
        [self.localDataManager requestGeographicStoredPlacesCompletion:^(NSArray *geographicList, BOOL error) {
            [weakSelf.presenter didLoadGeographicPlacesWithItems:geographicList error:error];
        }];
    }else{
        [self.APIDataManager requestGeographicPlacesWithQuery:queryString andCompletion:^(NSArray *geographicList, BOOL error) {
            [weakSelf.presenter didLoadGeographicPlacesWithItems:geographicList error:error];
        }];
    }
}

- (void)storeGeonameItem:(Geoname *)geoname{
    [self.localDataManager storeGeonameItem:geoname];
}




@end
