//
//  MockNetworkService.m
//  Reader
//
//  Created by Antti Ahvenlampi on 15/11/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

#import "MockNetworkService.h"

@implementation MockNetworkService {
    NSMutableDictionary *_resultDict;
    NSMutableDictionary *_errorDict;
}

- (instancetype)init {
    if (self = [super init]) {
        _resultDict = [NSMutableDictionary dictionary];
        _errorDict = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)setResultData:(NSData *)data forUrl:(NSURL *)url
{
    _resultDict[url] = data;
}

- (void)setError:(NSError *)error forUrl:(NSURL *)url
{
    _errorDict[url] = error;
}

- (void)makeRequestWithUrl:(NSURL *)url completionHandler:(void (^)(NSData *, NSURLResponse *, NSError *))completionHandler {
    NSData *data = _resultDict[url];
    NSError *error = _errorDict[url];
    NSURLResponse *response = [[NSURLResponse alloc] initWithURL:url MIMEType:@"" expectedContentLength:0 textEncodingName:@""];
    completionHandler(data, response, error);
}

@end
