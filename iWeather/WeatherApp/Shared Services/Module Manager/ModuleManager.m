//
//  ModuleManager.m
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 1/4/17.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "ModuleManager.h"
#import "GeographicModuleWireFrame.h"

@interface ModuleManager ()
@property (nonatomic,strong) GeographicModuleWireFrame *geographicModule;
@end

@implementation ModuleManager

- (instancetype)init{
    if ((self = [super init])) {
        [self configureDependencies];
    }
    return self;
}

- (void)configureDependencies{
    self.geographicModule = [[GeographicModuleWireFrame alloc] init];
}

- (void)installRootViewControllerIntoWindow:(id)window{
    [self.geographicModule presentGeographicModuleFrom:window];
}

@end
