//
//  Article.m
//  Reader
//
//  Created by Antti Ahvenlampi on 13/11/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

#import "Article.h"

@implementation Article

+ (instancetype)articleWithTitle:(NSString *)title description:(NSString *)description url:(NSURL *)url pubDate:(NSDate *)pubDate {
    return [[[self class] alloc] initWithTitle:title description:description url:url pubDate:pubDate];
}

- (instancetype)initWithTitle:(NSString*)title description:(NSString*)description url:(NSURL*)url pubDate:(NSDate*)pubDate
{
    if (self = [super init]) {
        _title = title;
        _desc = description;
        _url = url;
        _pubDate = pubDate;
    }
    return self;
}

- (BOOL)isEqual:(id)object
{
    if (object == nil) {
        return NO;
    }
    
    if (![object isKindOfClass:[Article class]]) {
        return NO;
    }
    
    Article *article = (Article*)object;
    return [article.title isEqualToString:self.title] &&
        [article.desc isEqualToString:self.desc] &&
        [article.url isEqual:self.url] &&
        [article.pubDate isEqualToDate:self.pubDate];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Article(title:\"%@\",desc:\"%@\",url:%@,pubDate:%@)", self.title, self.desc, self.url, self.pubDate];
}

@end
