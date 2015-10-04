//
//  MMDetailViewController.h
//  iWeather
//
//  Created by Juan Miguel Marqués Morilla on 4/10/15.
//  Copyright © 2015 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "MMGeographicPlace.h"

@interface MMDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (weak, nonatomic) MMGeographicPlace *place;

@property (weak, nonatomic) IBOutlet UILabel *placeNameLabel
;
@property (weak, nonatomic) IBOutlet UILabel *weatherCloudyLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherTempartureLabel;
@property (weak, nonatomic) IBOutlet UIView *temperatureBar;

@end
