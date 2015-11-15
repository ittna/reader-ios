//
//  NSURLSession+NetworkService.m
//  Reader
//
//  Created by Antti Ahvenlampi on 15/11/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

#import "NSURLSession+NetworkService.h"

@implementation NSURLSession (NetworkService)

- (void)makeRequestWithUrl:(NSURL *)url completionHandler:(void (^)(NSData *, NSURLResponse *, NSError *))completionHandler {
    NSURLSessionDataTask *task = [self dataTaskWithURL:url completionHandler:completionHandler];
    [task resume];
}

@end
