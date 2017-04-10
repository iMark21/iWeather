//
//  WeatherModulePresenter.m
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "WeatherModulePresenter.h"
#import "WeatherModuleWireframe.h"

@implementation WeatherModulePresenter

#pragma mark - Input methods

- (void)viewDidLoad{
    [self.interactor requestGeographicPlacesWithGeoname:self.geoname];
    [self didLoadGeonameplace];
}

#pragma mark - Output methods

- (void)didLoadWeatherDetails:(NSArray *)weatherObservations error:(BOOL)error{
    if (!error && weatherObservations.count != 0) {
        [self.view setWeatherTemperature:[self calculateTemperature:weatherObservations]];
        [self.view configureTemperatureView:[self calculateTemperature:weatherObservations]*2/100  withColor:[self colorForTemperature:[self calculateTemperature:weatherObservations]]];
        [self.view setMapRegion:[self getRegion]];
    }else{
        [self.view showErrorView:true];
    }
}

- (void)didLoadGeonameplace{
    [self.view setGeonamePlace:self.geoname.name];
    [self.view setPopulationText:[NSString stringWithFormat:@"%@",self.geoname.population]];
}

#pragma mark - private calcule methods

- (CGFloat)calculateTemperature:(NSArray*)weatherObservations{
    CGFloat totalTemperature = 0;
    NSInteger counter = 0;
    for (WeatherObservation *wObservation in weatherObservations) {
        if (wObservation.temperature.length!=0 && wObservation.temperature !=nil) {
            totalTemperature = totalTemperature + [wObservation.temperature floatValue];
            counter ++;
        }
    }
    return totalTemperature/counter;
}

- (MKCoordinateRegion)getRegion{
    MKCoordinateRegion region;
    region.center.latitude = [self.geoname.lat floatValue];
    region.center.longitude = [self.geoname.lng floatValue];
    region.span.latitudeDelta =  0.025;
    region.span.longitudeDelta =  0.025;
    return region;
}

- (UIColor*)colorForTemperature:(CGFloat)temperature{
    if (temperature < 15) {
        return [UIColor blueColor];
    }else if (temperature>=15 && temperature<25){
        return  [UIColor orangeColor];
    }else{
        return [UIColor redColor];
    }
}

@end
