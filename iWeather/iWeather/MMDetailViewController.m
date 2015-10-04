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
#import "THProgressView.h"

@interface MMDetailViewController ()

@end

@implementation MMDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self configureUI];
    
    [self loadData];
    
    ;
}

-(void)configureUI{
    
    self.weatherCloudyLabel.text = NSLocalizedString(@"We don't have information for this place", @"");
    
    self.weatherTempartureLabel.text = NSLocalizedString(@"We don't have information for this place", @"");
    
    self.placeNameLabel.text = self.place.name;
    
    float spanX = 0.025;
    float spanY = 0.025;
    
    MKCoordinateRegion region;
    region.center.latitude = [self.place.lat floatValue];
    region.center.longitude = [self.place.lng floatValue];
    region.span.latitudeDelta = spanX;
    region.span.longitudeDelta = spanY;
    
    [self.mapView setRegion:region animated:YES];
    
}

-(void)updateUIwithTemperatureValue: (NSString*)tempString{
    
    
    THProgressView *topProgressView = [[THProgressView alloc] initWithFrame:self.temperatureBar.bounds];
    
    topProgressView.borderTintColor = [UIColor whiteColor];

    if ([tempString integerValue]< 44) {
        topProgressView.progressTintColor = [UIColor greenColor];
    }
    else{
        topProgressView.progressTintColor = [UIColor redColor];
    }
    
    
    self.temperatureBar.backgroundColor = [UIColor clearColor];
    
    [topProgressView setProgress:[tempString floatValue]*2/100 animated:YES];
    
    [self.temperatureBar addSubview:topProgressView];
    
    

}

-(void)loadData{
    
    self.place = _place;
    
    [SVProgressHUD showWithStatus:@"Cargando" maskType:SVProgressHUDMaskTypeGradient];
    
    [[MMAPI sharedInstance]queryWeatherWithGeographicPlace:self.place completionBlock:^(NSArray *JSONArray, NSError *error) {
        
        if ([[JSONArray valueForKey:@"weatherObservations"] count]==0 || JSONArray == nil) {
        
            UIAlertController * alert=   [UIAlertController
                                          alertControllerWithTitle:@"Ooops!"                                                  message:NSLocalizedString(@"Something goes wrong. Please choosse another place", @"")
                                          preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *cancelButton = [UIAlertAction
                                       actionWithTitle:@"Ok"
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction * action)
                                       {
                                           [alert dismissViewControllerAnimated:YES completion:nil];
                                           
                                       }];
            
            [alert addAction:cancelButton];
            
            [self presentViewController:alert animated:YES completion:nil];

        
        }else{
            
            for (id item in [JSONArray valueForKey:@"weatherObservations"]){
                
                
                
                if ([item isKindOfClass:[NSDictionary class]]) {
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        self.weatherCloudyLabel.text = [NSString stringWithFormat:@"Information: %@",[item valueForKey:@"clouds"]];
                        
                        self.weatherTempartureLabel.text = [NSString stringWithFormat:@"%@ ºC",[item valueForKey:@"temperature"]];
                        
                        [self updateUIwithTemperatureValue:self.weatherTempartureLabel.text];
                        
                        self.placeNameLabel.text = self.place.name;
                        
                        
                        
                    });
                }
                
                
                
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
    
            [SVProgressHUD dismiss];

        });
  
    }];

    
}




@end
