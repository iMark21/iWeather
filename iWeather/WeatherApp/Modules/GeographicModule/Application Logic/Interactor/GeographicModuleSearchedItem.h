//
//  GeographicModuleStoredItem.h
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 1/4/17.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <Realm/Realm.h>

@interface GeographicModuleSearchedItem : RLMObject

@property (nonatomic, strong) NSNumber<RLMInt> *geonameId;
@property (nonatomic, strong) NSNumber<RLMFloat> *east;
@property (nonatomic, strong) NSNumber<RLMFloat> *south;
@property (nonatomic, strong) NSNumber<RLMFloat> *north;
@property (nonatomic, strong) NSNumber<RLMFloat> *west;
@property (nonatomic,strong) NSString *lat;
@property (nonatomic,strong) NSString *lng;
@property (nonatomic,strong) NSString *name;
@property (nonatomic, strong) NSNumber<RLMInt> *population;

@end
