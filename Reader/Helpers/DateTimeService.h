//
//  DateTimeService.h
//  Reader
//
//  Created by Antti Ahvenlampi on 16/11/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DateTimeService <NSObject>

- (NSDate*)currentDate;

@end
