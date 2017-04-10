//
//  GeographicModuleViewControllerTests.h
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "GeographicModuleProtocols.h"
#import "GeographicModuleViewController.h"

@interface GeographicModuleViewControllerTests : XCTestCase

@property (nonatomic, strong) GeographicModuleViewController *controller;
@property (nonatomic, strong) id mockOutput;

@end

@implementation GeographicModuleViewControllerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.

    self.controller = [[GeographicModuleViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(GeographicModulePresenterProtocol));

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
