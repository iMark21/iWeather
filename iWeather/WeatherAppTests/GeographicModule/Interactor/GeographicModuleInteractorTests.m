//
//  GeographicModuleInteractorTests.h
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "GeographicModuleProtocols.h"
#import "GeographicModuleInteractor.h"

@interface GeographicModuleInteractorTests : XCTestCase

@property (nonatomic, strong) GeographicModuleInteractor *interactor;
@property (nonatomic, strong) id mockOutput;

@end

@implementation GeographicModuleInteractorTests

- (void)setUp {
    [super setUp];

    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.interactor = [[GeographicModuleInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(GeographicModuleInteractorInputProtocol));

    self.interactor.presenter = self.mockOutput;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.interactor = nil;

    self.mockOutput = nil;

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
