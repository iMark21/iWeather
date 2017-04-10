//
//  GeographicModulePresenter.m
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "GeographicModulePresenter.h"
#import "GeographicModuleWireframe.h"

@implementation GeographicModulePresenter

#pragma mark - Input methods

- (void)viewDidLoad{
    [self.interactor requestGeographicPlacesWithQuery:@""];
}

- (void)reloadViewWithQuery:(NSString*)querySring{
    [self.interactor requestGeographicPlacesWithQuery:querySring];
}

- (void)storeGeonameItem:(Geoname *)geoname{
    [self.interactor storeGeonameItem:geoname];
}

- (void)didSelected:(Geoname *)geoname{
    [self.wireFrame presentWeatherModuleWithGeoname:geoname From:self.view];
}

#pragma mark - Output methods

- (void)didLoadGeographicPlacesWithItems:(NSArray*)geographicPlaces error:(BOOL)error{
    [self.view setGeographicListDataSource:geographicPlaces error:error];
}

@end
