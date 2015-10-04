//
//  MMAPI.m
//  iWeather
//
//  Created by Juan Miguel Marqués Morilla on 4/10/15.
//  Copyright © 2015 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "MMAPI.h"
#import "MMGeographicPlace.h"



@implementation MMAPI

+(instancetype)sharedInstance{
    
    static dispatch_once_t once;
    static id sharedInstance;
    
    dispatch_once(&once, ^{
        sharedInstance = [self new];
    });
    
    return sharedInstance;
    
}

- (void)queryPlacesWithString:(NSString *) placeString completionBlock:(void (^)(NSArray *JSONArray, NSError *error)) block {
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURL *queryURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.geonames.org/searchJSON?q=%@&maxRows=20&startRow=0&lang=en&isNameRequired=true&style=FULL&username=ilgeonamessample",placeString]];
    
    [[session dataTaskWithURL:queryURL
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {

                NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                
                
                if(jsonArray) {
                    block(jsonArray, nil);
                    
                } else {
                    NSError *error = [NSError errorWithDomain:@"plist_download_error" code:1
                                                     userInfo:[NSDictionary dictionaryWithObject:@"Can't fetch data" forKey:NSLocalizedDescriptionKey]];
                    block(nil, error);
                }

            }] resume];


    
}

- (void)queryWeatherWithGeographicPlace:(MMGeographicPlace *) place completionBlock:(void (^)(NSArray *JSONArray, NSError *error)) block {
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURL *queryURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.geonames.org/weatherJSON?north=%@&south=%@&east=%@&west=%@&username=ilgeonamessample",place.north,place.south,place.east,place.west]];

    
    [[session dataTaskWithURL:queryURL
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                
                if (data != nil) {
                    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                    
                    
                    if(jsonArray) {
                        block(jsonArray, nil);
                        
                    } else {
                        NSError *error = [NSError errorWithDomain:@"plist_download_error" code:1
                                                         userInfo:[NSDictionary dictionaryWithObject:@"Can't fetch data" forKey:NSLocalizedDescriptionKey]];
                        block(nil, error);
                    }

                }
                
                
            }] resume];
    
    
    
}

@end
