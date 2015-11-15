//
//  ArticleStore.h
//  Reader
//
//  Created by Antti Ahvenlampi on 13/11/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SuccessHandler)(NSArray*);

@interface ArticleStore : NSObject

- (void)fetchArticles:(SuccessHandler)successCallback;

@end
