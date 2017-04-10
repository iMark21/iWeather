//
//  WeatherRequest.h
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 1/4/17.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface WeatherRequest : AFHTTPSessionManager

+ (WeatherRequest*)sharedInstance;

@end
