//
//  Article.m
//  Reader
//
//  Created by Antti Ahvenlampi on 13/11/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

#import "Article.h"

@implementation Article

+ (instancetype)articleWithTitle:(NSString *)title description:(NSString *)description url:(NSURL *)url {
    return [[[self class] alloc] initWithTitle:title description:description url:url];
}

- (instancetype)initWithTitle:(NSString*)title description:(NSString*)description url:(NSURL*)url
{
    if (self = [super init]) {
        _title = title;
        _desc = description;
        _url = url;
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
        [article.url isEqual:self.url];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Article(title:\"%@\",desc:\"%@\",url:%@)", self.title, self.desc, self.url];
}

@end
