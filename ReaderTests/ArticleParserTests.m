//
//  ArticleParserTests.m
//  ReaderTests
//
//  Created by Antti Ahvenlampi on 15/11/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Article.h"
#import "ArticleParser.h"

@interface ArticleParserTests : XCTestCase

@end

@implementation ArticleParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testParsingSimpleFeedCallsSuccessHandlerWithExpectedArticle {
    NSURL *simpleFeedUrl = [[NSBundle bundleForClass:[self class]] URLForResource:@"simplefeed" withExtension:@"xml"];
    
    // Mon, 09 Nov 2015 07:58:26 GMT
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.day = 9;
    dateComponents.month = 11;
    dateComponents.year = 2015;
    dateComponents.hour = 7;
    dateComponents.minute = 58;
    dateComponents.second = 26;
    dateComponents.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"success handler gets called"];
    NSArray *expectedArticles = @[[Article articleWithTitle:@"Osborne 'secures deals' on 30% cuts" description:@"Four government departments have provisionally agreed to cut their spending by an average of 30% over the next four years, George Osborne is to announce." url:[NSURL URLWithString:@"http://www.bbc.co.uk/news/uk-34763261#sa-ns_mchannel=rss&ns_source=PublicRSS20-sa"] pubDate:[calendar dateFromComponents:dateComponents]]];
    ArticleParser *articleParser = [[ArticleParser alloc] initWithSuccessHandler:^(NSArray *articles) {
        XCTAssertEqualObjects(expectedArticles, articles);
        [successExpectation fulfill];
    }];
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:[NSData dataWithContentsOfURL:simpleFeedUrl]];
    parser.delegate = articleParser;
    [parser parse];

    [self waitForExpectationsWithTimeout:0 handler:nil];
}

@end
