//
//  GeographicModuleWireFrame.m
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "GeographicModuleWireFrame.h"

static NSString *const kGeographicModuleViewControllerKey = @"GeographicModuleViewController";

@interface GeographicModuleWireFrame ()

@property (nonatomic, strong) GeographicModuleViewController *geographicModuleViewController;
@property (nonatomic, strong) WeatherModuleWireFrame *weatherModulWireframe;
@end

@implementation GeographicModuleWireFrame

- (void)presentGeographicModuleFrom:(id)window{
    self.geographicModuleViewController = [self createViewControllerWithKey:kGeographicModuleViewControllerKey];
    GeographicModuleInteractor *interactor = [[GeographicModuleInteractor alloc] init];
    GeographicModuleAPIDataManager *dataManagerAPI = [[GeographicModuleAPIDataManager alloc] init];
    GeographicModuleLocalDataManager *dataManagerLocal = [[GeographicModuleLocalDataManager alloc] init];
    self.presenter = [[GeographicModulePresenter alloc] init];
    
    self.presenter.wireFrame = self;
    self.presenter.interactor = interactor;
    self.presenter.view = self.geographicModuleViewController;
    
    interactor.APIDataManager = dataManagerAPI;
    interactor.localDataManager = dataManagerLocal;
    interactor.presenter = self.presenter;
    
    self.geographicModuleViewController.presenter = self.presenter;
    [self showRootViewController:self.geographicModuleViewController inWindow:window];
}

-(void)presentWeatherModuleWithGeoname:(Geoname*)geoname From:(id)fromView{
    self.weatherModulWireframe = [[WeatherModuleWireFrame alloc] init];
    [self.weatherModulWireframe presentWeatherDetailGeoname:geoname fromVC:fromView];
}



@end
