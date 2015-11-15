//
//  MockNetworkService.h
//  Reader
//
//  Created by Antti Ahvenlampi on 15/11/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NetworkService.h"

@interface MockNetworkService : NSObject<NetworkService>

- (void)setResultData:(NSData*)data forUrl:(NSURL*)url;
- (void)setError:(NSError*)error forUrl:(NSURL*)url;

@end
