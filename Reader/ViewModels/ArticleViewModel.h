//
//  ArticleViewModel.h
//  Reader
//
//  Created by Antti Ahvenlampi on 15/11/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DateTimeService.h"

@class Article;

@interface ArticleViewModel : NSObject

@property(nonatomic,copy,readonly) NSString *title;
@property(nonatomic,copy,readonly) NSString *desc;
@property(nonatomic,copy,readonly) NSURL *url;
@property(nonatomic,copy,readonly) NSString *publishedSince;

- (instancetype)initWithArticle:(Article*)article dateTimeService:(id<DateTimeService>)dateTimeService;

@end
