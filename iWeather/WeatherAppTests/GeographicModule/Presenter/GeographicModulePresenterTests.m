//
//  GeographicModulePresenterTests.h
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "GeographicModuleProtocols.h"
#import "GeographicModulePresenter.h"

@interface GeographicModulePresenterTests : XCTestCase

@property (nonatomic, strong) GeographicModulePresenter *presenter;
@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockWireframe;
@property (nonatomic, strong) id mockView;

@end

@implementation GeographicModulePresenterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.

    self.presenter = [[GeographicModulePresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(GeographicModuleInteractorInputProtocol));
    self.mockWireframe = OCMProtocolMock(@protocol(GeographicModuleWireFrameProtocol));
    self.mockViewController = OCMProtocolMock(@protocol(GeographicModuleViewProtocol));

    self.presenter.interactor = self.mockInteractor;
    self.presenter.router = self.mockWireframe;
    self.presenter.view = self.mockViewController;

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.

    self.presenter = nil;

    self.mockViewController = nil;
    self.mockWireframe = nil;
    self.mockInteractor = nil;

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
