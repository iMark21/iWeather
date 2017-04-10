//
//  GeographicModuleInteractor.h
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GeographicModuleProtocols.h"

@interface GeographicModuleInteractor : NSObject <GeographicModuleInteractorInputProtocol>

@property (nonatomic, weak) id <GeographicModuleInteractorOutputProtocol> presenter;
@property (nonatomic, strong) id <GeographicModuleAPIDataManagerProtocol> APIDataManager;
@property (nonatomic, strong) id <GeographicModuleLocalDataManagerProtocol> localDataManager;

- (void)requestGeographicPlacesWithQuery:(NSString*)queryString;

@end
