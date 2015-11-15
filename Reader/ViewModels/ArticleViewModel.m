//
//  ArticleViewModel.m
//  Reader
//
//  Created by Antti Ahvenlampi on 15/11/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

#import "ArticleViewModel.h"

#import "Article.h"

@implementation ArticleViewModel {
    Article *_article;
}

- (instancetype)initWithArticle:(Article *)article {
    if (self = [super init]) {
        _article = article;
    }
    return self;
}

- (NSString *)title {
    return _article.title;
}

- (NSString *)desc {
    return _article.desc;
}

- (NSURL *)url {
    return _article.url;
}

- (NSString *)publishedSince {
    NSTimeInterval since = -[_article.pubDate timeIntervalSinceNow];
    if (since < 60) {
        return @"just now";
    }
    since /= 60;
    if (since < 60) {
        return [NSString stringWithFormat:@"%.0lf minute(s) ago", since];
    }
    since /= 60;
    if (since < 24) {
        return [NSString stringWithFormat:@"%.0lf hour(s) ago", since];
    }
    return @"older than one day";
}

@end
