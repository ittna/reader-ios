//
//  ReaderUITests.m
//  ReaderUITests
//
//  Created by Antti Ahvenlampi on 16/11/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ReaderUITests : XCTestCase

@end

@implementation ReaderUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.tables.staticTexts[@"Dozens arrested across France in raids"] tap];
    [app.staticTexts[@"British security services prevented attack in the UK last month - taking it to seven this year, Number 10 says"] tap];
    [[app.navigationBars containingType:XCUIElementTypeStaticText identifier:@"Dozens arrested across France in raids"].buttons[@"Back"] tap];
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    XCTAssertTrue(YES);
}

@end
