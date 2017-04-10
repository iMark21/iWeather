//
//  WeatherModuleInteractor.m
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "WeatherModuleInteractor.h"

@implementation WeatherModuleInteractor

- (void)requestGeographicPlacesWithGeoname:(Geoname *)geoname{
    __weak typeof(self) weakSelf = self;
    [self.APIDataManager requestWeatherForGeoname:geoname andCompletion:^(NSArray *weatherObservations, BOOL error) {
        [weakSelf.presenter didLoadWeatherDetails:weatherObservations error:error];
    }];
}

@end
