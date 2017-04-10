//
//  WeatherModuleViewControllerTests.h
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "WeatherModuleProtocols.h"
#import "WeatherModuleViewController.h"

@interface WeatherModuleViewControllerTests : XCTestCase

@property (nonatomic, strong) WeatherModuleViewController *controller;
@property (nonatomic, strong) id mockOutput;

@end

@implementation WeatherModuleViewControllerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.

    self.controller = [[WeatherModuleViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(WeatherModulePresenterProtocol));

    self.controller.presenter = self.mockOutput;
}

- (void)tearDown {
    self.controller = nil;

    self.mockOutput = nil;

    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
