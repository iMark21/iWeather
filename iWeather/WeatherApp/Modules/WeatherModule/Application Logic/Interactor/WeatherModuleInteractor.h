//
//  WeatherModuleInteractor.h
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherModuleProtocols.h"

@interface WeatherModuleInteractor : NSObject <WeatherModuleInteractorInputProtocol>

@property (nonatomic, weak) id <WeatherModuleInteractorOutputProtocol> presenter;
@property (nonatomic, strong) id <WeatherModuleAPIDataManagerProtocol> APIDataManager;

@end
