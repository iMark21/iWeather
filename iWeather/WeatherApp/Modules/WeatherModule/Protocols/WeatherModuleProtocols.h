//
//  WeatherModuleProtocols.h
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherModuleItem.h"
#import "GeographicModuleItem.h"
#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>

typedef void (^WeatherModuleCompletionBlock)(NSArray *weatherObservations, BOOL error);

@protocol WeatherModuleInteractorOutputProtocol;
@protocol WeatherModuleInteractorInputProtocol;
@protocol WeatherModuleViewProtocol;
@protocol WeatherModulePresenterProtocol;
@protocol WeatherModuleAPIDataManagerProtocol;

@class WeatherModuleWireFrame;

@protocol WeatherModuleViewProtocol
- (void)showWeatherDetail;
- (void)setWeatherTemperature:(CGFloat)temperature;
- (void)setGeonamePlace:(NSString*)geoname;
- (void)setMapRegion:(MKCoordinateRegion)region;
- (void)setPopulationText:(NSString*)population;
- (void)configureTemperatureView:(CGFloat)temperature withColor:(UIColor*)color;
- (void)showErrorView:(BOOL)show;
@end

@protocol WeatherModuleWireFrameProtocol
- (void)presentWeatherDetailGeoname:(Geoname*)geoname fromVC:(id)fromView;
@end

@protocol WeatherModulePresenterProtocol
- (void)viewDidLoad;
@end

@protocol WeatherModuleInteractorOutputProtocol
- (void)didLoadWeatherDetails:(NSArray*)weatherObservations error:(BOOL)error;
- (void)didLoadGeonameplace;
@end

@protocol WeatherModuleInteractorInputProtocol
- (void)requestGeographicPlacesWithGeoname:(Geoname*)geoname;
@end

@protocol WeatherModuleAPIDataManagerProtocol
- (void)requestWeatherForGeoname:(Geoname *)geoname andCompletion:(WeatherModuleCompletionBlock)completion;
@end

