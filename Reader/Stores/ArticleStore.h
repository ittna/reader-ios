//
//  ArticleStore.h
//  Reader
//
//  Created by Antti Ahvenlampi on 13/11/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NetworkService.h"

typedef void (^SuccessHandler)(NSArray*);

@interface ArticleStore : NSObject

- (instancetype)initWithNetworkService:(id<NetworkService>)networkService;

- (void)fetchArticles:(SuccessHandler)successCallback;

@end
