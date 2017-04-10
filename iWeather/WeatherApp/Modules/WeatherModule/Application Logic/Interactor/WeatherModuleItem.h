//
//  WeatherModuleItem.h
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>



@protocol WeatherObservation <NSObject>
@end
@interface WeatherObservation : JSONModel

@property (nonatomic, strong) NSNumber <Optional> *lng;
@property (nonatomic, strong) NSString <Optional> *observation;
@property (nonatomic, strong) NSString <Optional> *clouds;
@property (nonatomic, strong) NSString <Optional> *dewPoint;
@property (nonatomic, strong) NSString <Optional> *cloudsCode;
@property (nonatomic, strong) NSString <Optional> *datetime;
@property (nonatomic, strong) NSString <Optional> *temperature;
@property (nonatomic, strong) NSNumber <Optional> *humidity;
@property (nonatomic, strong) NSString <Optional> *stationName;
@property (nonatomic, strong) NSString <Optional> *weatherCondition;
@property (nonatomic, strong) NSString <Optional> *windDirection;
@property (nonatomic, strong) NSString <Optional> *hectoPascAltimeter;
@property (nonatomic, strong) NSString <Optional> *windSpeed;
@property (nonatomic, strong) NSString <Optional> *lat;

@end

@protocol WeatherModuleItem <NSObject>
@end
@interface WeatherModuleItem : JSONModel

@property (nonatomic, strong) NSArray <WeatherObservation,Optional> *weatherObservations;

@end
