//
//  GeographicModuleViewController.h
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeographicModuleProtocols.h"

@interface GeographicModuleViewController : UIViewController <GeographicModuleViewProtocol>
@property (nonatomic, strong) id <GeographicModulePresenterProtocol> presenter;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end
