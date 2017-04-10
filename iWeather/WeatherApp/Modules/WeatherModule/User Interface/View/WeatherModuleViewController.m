//
//  WeatherModuleViewController.m
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "WeatherModuleViewController.h"
#import "THProgressView.h"

@implementation WeatherModuleViewController

#pragma mark - ViewController Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showWeatherDetail];
}

#pragma mark - Input methods

- (void)showWeatherDetail{
    [self.presenter viewDidLoad];
}

#pragma mark - Output methods

- (void)configureTemperatureView:(CGFloat)temperature withColor:(UIColor *)color{
    THProgressView *topProgressView = [[THProgressView alloc] initWithFrame:self.temperatureView.bounds];
    topProgressView.borderTintColor = [UIColor whiteColor];
    topProgressView.progressTintColor = color;
    self.temperatureView.backgroundColor = [UIColor clearColor];
    [topProgressView setProgress:temperature  animated:YES];
    [self.temperatureView addSubview:topProgressView];
}

- (void)setWeatherTemperature:(CGFloat)temperature{
    [self.temperatureLabel setText:[NSString stringWithFormat:@"Temperatura: %.1fºC",temperature]];
}

- (void)setPopulationText:(NSString *)population{
    [self.populationLabel setText:[NSString stringWithFormat:@"Población: %@",population]];
}

- (void)setGeonamePlace:(NSString *)geoname{
    [self.geonanameLabel setText:[NSString stringWithFormat:@"Ubicación: %@",geoname]];
}

- (void)setMapRegion:(MKCoordinateRegion)region{
    [self.mapView setRegion:region];
}

#pragma mak - Error View

- (void)showErrorView:(BOOL)show{
    if (show) {
        [self.temperatureLabel setText:@"No hemos podidos obtener la temperatura"];
    }
}

@end
