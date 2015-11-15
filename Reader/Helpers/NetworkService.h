//
//  NetworkService.h
//  Reader
//
//  Created by Antti Ahvenlampi on 15/11/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetworkService <NSObject>

- (void)makeRequestWithUrl:(NSURL*)url completionHandler:(void (^)(NSData * data, NSURLResponse * response, NSError * error))completionHandler;

@end
