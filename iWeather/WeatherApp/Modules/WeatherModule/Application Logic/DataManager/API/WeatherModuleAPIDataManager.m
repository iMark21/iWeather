//
//  WeatherModuleAPIDataManager.m
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "WeatherModuleAPIDataManager.h"
#import "WeatherRequest.h"
#import "Defines.h"

@implementation WeatherModuleAPIDataManager

- (instancetype)init{
    if ((self = [super init])) {
    }
    return self;
}

#pragma mark - Request methods

- (void)requestWeatherForGeoname:(Geoname *)geoname andCompletion:(WeatherModuleCompletionBlock)completion{
    WeatherRequest *request = [WeatherRequest sharedInstance];
    NSString *url = [NSString stringWithFormat:WEATHER_PLACE_REQUEST,geoname.bbox.north,geoname.bbox.south,geoname.bbox.east,geoname.bbox.west];
    [request GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *currentError;
        WeatherModuleItem *weatherModuleItem = [[WeatherModuleItem alloc]initWithDictionary:responseObject error:&currentError];
        if (!currentError) {
            completion (weatherModuleItem.weatherObservations,false);
        }else{
            completion (nil,true);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completion (nil,true);
    }];
}

@end
