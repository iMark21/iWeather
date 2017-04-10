//
//  WeatherRequest.m
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 1/4/17.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "WeatherRequest.h"
#import "Reachability.h"

@implementation WeatherRequest

#define TIMEOUT_REQUEST 20.0

#pragma mark - Singleton methods

+ (WeatherRequest*)sharedInstance {
    static WeatherRequest *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // Session configuration setup
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        sessionConfiguration.requestCachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        
        sessionConfiguration.timeoutIntervalForRequest = TIMEOUT_REQUEST;
        sessionConfiguration.timeoutIntervalForResource = TIMEOUT_REQUEST;
        // Initialize the session
        _sharedInstance = [[WeatherRequest alloc] initWithSessionConfiguration:sessionConfiguration];
    });
    
    return _sharedInstance;
}

#pragma mark - Override methods

- (instancetype)initWithSessionConfiguration:(NSURLSessionConfiguration *)configuration{
    self = [super initWithSessionConfiguration:configuration];
    if (self)
    {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/javascript", @"text/html", @"application/json", @"text/json",@"application/x-javascript", @"text/plain",nil];
    }
    return self;
}

@end
