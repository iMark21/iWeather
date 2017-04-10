//
//  WeatherModuleViewController.h
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherModuleProtocols.h"

@interface WeatherModuleViewController : UIViewController <WeatherModuleViewProtocol>

@property (nonatomic, strong) id <WeatherModulePresenterProtocol> presenter;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (weak, nonatomic) IBOutlet UILabel *geonanameLabel;
@property (weak, nonatomic) IBOutlet UILabel *populationLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UIView *temperatureView;

@end
