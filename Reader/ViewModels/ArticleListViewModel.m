//
//  ArticleListViewModel.m
//  Reader
//
//  Created by Antti Ahvenlampi on 15/11/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

#import "ArticleListViewModel.h"

#import "ArticleViewModel.h"
#import "ArticleParser.h"

#import "RealDateTimeService.h"

NSString * const ArticlesURL = @"http://feeds.bbci.co.uk/news/rss.xml";

@implementation ArticleListViewModel {
    NSArray *_articles;
    id<NetworkService> _networkService;
}

- (instancetype)initWithNetworkService:(id<NetworkService>)networkService {
    if (self = [super init]) {
        _articles = @[];
        _networkService = networkService;
    }
    return self;
}

- (NSArray *)articles {
    return _articles;
}

- (void)loadWithCompletion:(CompletionHandler)completion {
    NSURL * const articlesURL = [NSURL URLWithString:ArticlesURL];
    
    __weak ArticleListViewModel *weakSelf = self;
    [_networkService makeRequestWithUrl:articlesURL completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        if (error != nil) {
            NSLog(@"error: %@", error);
        } else if (data != nil) {
            ArticleParser *articleParser = [[ArticleParser alloc] initWithSuccessHandler:^(NSArray *articles) {
                ArticleListViewModel *strongSelf = weakSelf;
                
                id<DateTimeService> dateTimeService = [[RealDateTimeService alloc] init];
                
                NSMutableArray *articleViewModels = [NSMutableArray array];
                [articles enumerateObjectsUsingBlock:^(Article *article, NSUInteger idx, BOOL *stop) {
                    [articleViewModels addObject:[[ArticleViewModel alloc] initWithArticle:article dateTimeService:dateTimeService]];
                }];
                
                strongSelf->_articles = [NSArray arrayWithArray:articleViewModels];
                completion();
            }];
            
            NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
            parser.delegate = articleParser;
            
            [parser parse];
        }
    }];
}

@end
