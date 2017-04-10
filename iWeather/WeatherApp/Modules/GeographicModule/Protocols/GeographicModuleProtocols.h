//
//  GeographicModuleProtocols.h
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GeographicModuleItem.h"

typedef void (^GeographicModuleCompletionBlock)(NSArray *geographicList, BOOL error);

@protocol GeographicModuleInteractorOutputProtocol;
@protocol GeographicModuleInteractorInputProtocol;
@protocol GeographicModuleViewProtocol;
@protocol GeographicModulePresenterProtocol;
@protocol GeographicModuleLocalDataManagerProtocol;
@protocol GeographicModuleAPIDataManagerProtocol;

@class GeographicModuleWireFrame;

@protocol GeographicModuleViewProtocol
- (void)showGeographicList;
- (void)setGeographicListDataSource:(NSArray *)geographicPlaces error:(BOOL)error;
@end

@protocol GeographicModuleWireFrameProtocol
- (void)presentGeographicModuleFrom:(id)fromView;
- (void)presentWeatherModuleWithGeoname:(Geoname*)geoname From:(id)fromView;
@end

@protocol GeographicModulePresenterProtocol
- (void)viewDidLoad;
- (void)reloadViewWithQuery:(NSString*)querySring;
- (void)storeGeonameItem:(Geoname*)geoname;
- (void)didSelected:(Geoname*)geoname;
@end

@protocol GeographicModuleInteractorOutputProtocol
- (void)didLoadGeographicPlacesWithItems:(NSArray*)geographicPlaces error:(BOOL)error;
@end

@protocol GeographicModuleInteractorInputProtocol
- (void)requestGeographicPlacesWithQuery:(NSString*)queryString;
- (void)storeGeonameItem:(Geoname*)geoname;
@end

@protocol GeographicModuleAPIDataManagerProtocol
- (void)requestGeographicPlacesWithQuery:(NSString *)queryString andCompletion:(GeographicModuleCompletionBlock)completion;
@end

@protocol GeographicModuleLocalDataManagerProtocol
- (void)requestGeographicStoredPlacesCompletion:(GeographicModuleCompletionBlock)completion;
- (void)storeGeonameItem:(Geoname*)geoname;
@end



