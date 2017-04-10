//
//  GeographicModuleWireFrame.h
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GeographicModuleProtocols.h"
#import "GeographicModuleViewController.h"
#import "GeographicModuleLocalDataManager.h"
#import "GeographicModuleAPIDataManager.h"
#import "GeographicModuleInteractor.h"
#import "GeographicModulePresenter.h"
#import "GeographicModuleWireframe.h"
#import "WeatherModuleWireFrame.h"
#import "RootWireframe.h"

#import <UIKit/UIKit.h>

@interface GeographicModuleWireFrame : RootWireframe <GeographicModuleWireFrameProtocol>

@property (nonatomic, strong) GeographicModulePresenter *presenter;

@end
