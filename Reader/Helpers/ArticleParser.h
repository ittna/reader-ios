//
//  ArticleParser.h
//  Reader
//
//  Created by Antti Ahvenlampi on 13/11/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SuccessHandler)(NSArray*);

@interface ArticleParser : NSObject <NSXMLParserDelegate>

- (instancetype)initWithSuccessHandler:(SuccessHandler)successHandler;

@end
