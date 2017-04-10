//
//  GeographicModuleAPIDataManager.m
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "GeographicModuleAPIDataManager.h"
#import "WeatherRequest.h"

#import "Defines.h"

@implementation GeographicModuleAPIDataManager

- (instancetype)init{
    if ((self = [super init])) {
    }
    return self;
}

#pragma mark - Request methods

- (void)requestGeographicPlacesWithQuery:(NSString *)queryString andCompletion:(GeographicModuleCompletionBlock)completion{
    NSString *queryNormalized = [queryString stringByAddingPercentEncodingWithAllowedCharacters : [NSCharacterSet URLFragmentAllowedCharacterSet]];
    WeatherRequest *request = [WeatherRequest sharedInstance];
    NSString *url = [NSString stringWithFormat:GEOGRAPHIC_PLACE_REQUEST,queryNormalized];
    [request GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *currentError;
        GeographicModuleItem *geographicModuleItem = [[GeographicModuleItem alloc]initWithDictionary:responseObject error:&currentError];
        if (!currentError) {
            completion (geographicModuleItem.geonames,false);
        }else{
            completion (nil,true);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completion (nil,true);
    }];
}


@end
