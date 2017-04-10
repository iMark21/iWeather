//
//  WeatherModuleWireFrame.m
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "WeatherModuleWireFrame.h"

static NSString *const kMWeatherModuleViewControllerKey = @"WeatherModuleViewController";

@interface WeatherModuleWireFrame ()
@property (nonatomic, strong) UIViewController *presentedViewController;
@end

@implementation WeatherModuleWireFrame

- (void)presentWeatherDetailGeoname:(Geoname*)geoname fromVC:(id)fromView{
    self.presentedViewController = (UIViewController*)fromView;
    WeatherModuleViewController *viewController = [self createViewControllerWithKey:kMWeatherModuleViewControllerKey];
    WeatherModuleInteractor *interactor = [[WeatherModuleInteractor alloc] init];
    WeatherModuleAPIDataManager *dataManagerAPI = [[WeatherModuleAPIDataManager alloc] init];
    self.presenter = [[WeatherModulePresenter alloc] init];
    self.presenter.wireFrame = self;
    self.presenter.interactor = interactor;
    self.presenter.view = viewController;
    interactor.APIDataManager = dataManagerAPI;
    interactor.presenter  = self.presenter;
    viewController.presenter = self.presenter;
    self.presenter.geoname = geoname;
    [[fromView navigationController] pushViewController:viewController animated:true];
}

@end
