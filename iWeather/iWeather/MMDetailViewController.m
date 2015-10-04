//
//  MMDetailViewController.m
//  iWeather
//
//  Created by Juan Miguel Marqués Morilla on 4/10/15.
//  Copyright © 2015 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "MMDetailViewController.h"
#import "SVProgressHUD.h"
#import "MMAPI.h"

@interface MMDetailViewController ()

@end

@implementation MMDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self loadData];
    
    [self configureUI];
    
    
    
    
}


-(void)configureUI{
    
    float spanX = 0.00725;
    float spanY = 0.00725;
    
    MKCoordinateRegion region;
    region.center.latitude = [self.place.lat floatValue];
    region.center.longitude = [self.place.lng floatValue];
    region.span.latitudeDelta = spanX;
    region.span.longitudeDelta = spanY;
    
    [self.mapView setRegion:region animated:YES];

}

-(void)loadData{
    
    self.place = _place;
    
    [SVProgressHUD showWithStatus:@"Cargando" maskType:SVProgressHUDMaskTypeGradient];
    
    [[MMAPI sharedInstance]queryWeatherWithGeographicPlace:self.place completionBlock:^(NSArray *JSONArray, NSError *error) {
        
        if (JSONArray) {
          
            for (id item in [JSONArray valueForKey:@"weatherObservations"]){
                
                if ([item isKindOfClass:[NSDictionary class]]) {
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        self.weatherCloudyLabel.text = [item valueForKey:@"clouds"];
                        
                        self.weatherTempartureLabel.text = [item valueForKey:@"temperature"];
                        
                        self.placeNameLabel.text = self.place.name;
                        
                        [SVProgressHUD dismiss];
                        
                    });
                }
                
                
            }
            
            
           
        }

        
        
        
        
    }];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
