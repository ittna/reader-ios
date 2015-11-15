//
//  ArticleListViewModel.h
//  Reader
//
//  Created by Antti Ahvenlampi on 15/11/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NetworkService.h"

typedef void (^CompletionHandler)();

@interface ArticleListViewModel : NSObject

@property(nonatomic,strong,readonly) NSArray *articles;

- (instancetype)initWithNetworkService:(id<NetworkService>)networkService;

- (void)loadWithCompletion:(CompletionHandler)completion;

@end
