//
//  ViewController.m
//  Reader
//
//  Created by Antti Ahvenlampi on 13/11/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

#import "ArticleDetailViewController.h"

@interface ArticleDetailViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ArticleDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureView];
}

- (void)setArticle:(Article *)article
{
    _article = article;
    [self configureView];
}

- (void)configureView
{
    Article *article = self.article;
    UIWebView *webView = self.webView;
    
    if (article != nil && webView != nil) {
        self.title = article.title;
    
        [webView loadRequest:[[NSURLRequest alloc] initWithURL:article.url]];
    }
}

@end
