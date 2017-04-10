//
//  WeatherModuleWireFrame.h
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherModuleProtocols.h"
#import "WeatherModuleViewController.h"
#import "WeatherModuleAPIDataManager.h"
#import "WeatherModuleInteractor.h"
#import "WeatherModulePresenter.h"
#import "WeatherModuleWireframe.h"
#import "RootWireframe.h"

#import <UIKit/UIKit.h>

@interface WeatherModuleWireFrame : RootWireframe <WeatherModuleWireFrameProtocol>

@property (nonatomic, strong) WeatherModulePresenter *presenter;

@end
