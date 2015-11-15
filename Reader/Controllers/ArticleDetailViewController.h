//
//  ViewController.h
//  Reader
//
//  Created by Antti Ahvenlampi on 13/11/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ArticleViewModel;

@interface ArticleDetailViewController : UIViewController

@property(nonatomic, strong) ArticleViewModel* article;

@end

