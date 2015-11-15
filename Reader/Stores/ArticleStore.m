//
//  ArticleStore.m
//  Reader
//
//  Created by Antti Ahvenlampi on 13/11/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

#import "ArticleStore.h"

#import "Article.h"
#import "ArticleParser.h"

NSString * const ArticlesURL = @"http://feeds.bbci.co.uk/news/rss.xml";

@implementation ArticleStore

- (void)fetchArticles:(SuccessHandler)successCallback
{
    NSURL * const articlesURL = [NSURL URLWithString:ArticlesURL];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:articlesURL completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        if (error != nil) {
            NSLog(@"error: %@", error);
        } else if (data != nil) {
            ArticleParser *articleParser = [[ArticleParser alloc] initWithSuccessHandler:successCallback];
            
            NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
            parser.delegate = articleParser;
            
            [parser parse];
        } else {
            successCallback(@[]);
        }
    }];
    [task resume];
}

@end
