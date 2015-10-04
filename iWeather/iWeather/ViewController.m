//
//  ViewController.m
//  iWeather
//
//  Created by Juan Miguel Marqués Morilla on 4/10/15.
//  Copyright © 2015 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"
#import "MMAPI.h"

#define URL @"http://api.geonames.org/searchJSON?q=Madrid&maxRows=5&startRow=0&lang=en&isNameRequired=true&style=FULL&username=demo"

//http://api.geonames.org/weatherJSON?north=44.1&south=-9.9&east=-22.4&west=55.2&username=demo

#define url2 @"http://api.geonames.org/searchJSON?q=Madrid&maxRows=20&startRow=0&lang=en&isNameRequired=true&style=FULL&username=demo"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    
    //http://api.geonames.org/searchJSON?q=Madrid&maxRows=20&startRow=0&lang=en&isNameRequired=true&style=FULL&username=ilgeonamessample
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)loadData{
    
    [SVProgressHUD showWithStatus:@"Cargando" maskType:SVProgressHUDMaskTypeGradient];
    [[MMAPI sharedInstance]JSONArray:[NSURL URLWithString:URL] completionBlock:^(NSArray *JSONArray, NSError *error) {
        
        
        [SVProgressHUD dismiss];
        
    }];
    
}

@end
