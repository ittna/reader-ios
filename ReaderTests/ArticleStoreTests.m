//
//  ArticleStoreTests.m
//  Reader
//
//  Created by Antti Ahvenlampi on 15/11/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "ArticleStore.h"
#import "MockNetworkService.h"

@interface ArticleStoreTests : XCTestCase

@end

@implementation ArticleStoreTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFetchingSimpleFeedCallsSuccessHandler {
    NSURL *feedUrl = [[NSBundle bundleForClass:[self class]] URLForResource:@"simplefeed" withExtension:@"xml"];
    
    MockNetworkService *networkService = [[MockNetworkService alloc] init];
    [networkService setResultData:[NSData dataWithContentsOfURL:feedUrl] forUrl:[NSURL URLWithString:@"http://feeds.bbci.co.uk/news/rss.xml"]];
    
    ArticleStore *articleStore = [[ArticleStore alloc] initWithNetworkService:networkService];

    XCTestExpectation *successExpectation = [self expectationWithDescription:@"success handler gets called"];
    [articleStore fetchArticles:^(NSArray *articles) {
        XCTAssertEqual(1, [articles count]);
        [successExpectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:0 handler:nil];
}

@end
