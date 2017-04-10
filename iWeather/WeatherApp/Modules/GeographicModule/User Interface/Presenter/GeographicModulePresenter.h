//
//  GeographicModulePresenter.h
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GeographicModuleProtocols.h"

@class GeographicModuleWireFrame;

@interface GeographicModulePresenter : NSObject <GeographicModulePresenterProtocol, GeographicModuleInteractorOutputProtocol>

@property (nonatomic, weak) id <GeographicModuleViewProtocol> view;
@property (nonatomic, strong) id <GeographicModuleInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <GeographicModuleWireFrameProtocol> wireFrame;

@end
