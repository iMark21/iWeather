//
//  MMAPI.h
//  iWeather
//
//  Created by Juan Miguel Marqués Morilla on 4/10/15.
//  Copyright © 2015 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMGeographicPlace.h"

@interface MMAPI : NSObject

+(instancetype)sharedInstance;

- (void)queryPlacesWithString:(NSString *) placeString completionBlock:(void (^)(NSArray *JSONArray, NSError *error)) block ;

- (void)queryWeatherWithGeographicPlace:(MMGeographicPlace *) place completionBlock:(void (^)(NSArray *JSONArray, NSError *error)) block ;

-(void)saveCacheInformationWithString: (MMGeographicPlace*)place;

-(NSArray*)restoreCacheInformation;

@end
