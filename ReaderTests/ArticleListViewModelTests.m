//
//  ArticleListViewModelTests.m
//  Reader
//
//  Created by Antti Ahvenlampi on 15/11/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "ArticleListViewModel.h"
#import "MockNetworkService.h"

@interface ArticleListViewModelTests : XCTestCase

@end

@implementation ArticleListViewModelTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testLoadingSimpleFeedCallsCompletionHandler {
    NSURL *feedUrl = [[NSBundle bundleForClass:[self class]] URLForResource:@"simplefeed" withExtension:@"xml"];
    
    MockNetworkService *networkService = [[MockNetworkService alloc] init];
    [networkService setResultData:[NSData dataWithContentsOfURL:feedUrl] forUrl:[NSURL URLWithString:@"http://feeds.bbci.co.uk/news/rss.xml"]];
    
    ArticleListViewModel *listVM = [[ArticleListViewModel alloc] initWithNetworkService:networkService];

    XCTestExpectation *completionExpectation = [self expectationWithDescription:@"completion handler gets called"];
    [listVM loadWithCompletion:^{
        XCTAssertEqual(1, [listVM.articles count]);
        [completionExpectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

@end
