//
//  Article.h
//  Reader
//
//  Created by Antti Ahvenlampi on 13/11/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject

@property(nonatomic, copy, readonly) NSString *title;
@property(nonatomic, copy, readonly) NSString *desc;
@property(nonatomic, copy, readonly) NSURL *url;

+ (instancetype)articleWithTitle:(NSString*)title description:(NSString*)description url:(NSURL*)url;

@end
