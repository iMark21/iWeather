//
//  WeatherModulePresenter.h
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherModuleProtocols.h"

@class WeatherModuleWireFrame;

@interface WeatherModulePresenter : NSObject <WeatherModulePresenterProtocol, WeatherModuleInteractorOutputProtocol>

@property (nonatomic, weak) id <WeatherModuleViewProtocol> view;
@property (nonatomic, strong) id <WeatherModuleInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <WeatherModuleWireFrameProtocol> wireFrame;
@property (nonatomic, strong) Geoname *geoname;

@end
