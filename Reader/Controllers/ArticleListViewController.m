//
//  ArticleListViewController.m
//  Reader
//
//  Created by Antti Ahvenlampi on 13/11/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

#import "ArticleListViewController.h"

#import "ArticleStore.h"
#import "ArticleDetailViewController.h"
#import "ArticleCell.h"

#import "NSURLSession+NetworkService.h"

@interface ArticleListViewController ()

@property (nonatomic, strong) ArticleStore *articleStore;
@property (nonatomic, strong) NSArray *articles;

@end

@implementation ArticleListViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        _articleStore = [[ArticleStore alloc] initWithNetworkService:[NSURLSession sharedSession]];
        _articles = @[];
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 120;
    
    __weak ArticleListViewController *weakSelf = self;
    [self.articleStore fetchArticles:^(NSArray *articles) {
        dispatch_async(dispatch_get_main_queue(), ^{
            ArticleListViewController *strongSelf = weakSelf;
            strongSelf.articles = articles;
            [strongSelf.tableView reloadData];
        });
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(__unused UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(__unused UITableView *)tableView numberOfRowsInSection:(__unused NSInteger)section {
    return (NSInteger)[self.articles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ArticleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"articleCell" forIndexPath:indexPath];
    
    // Get the relevant article
    Article *article = self.articles[indexPath.row];
    
    // Configure the cell content
    cell.titleLabel.text = article.title;
    cell.descriptionLabel.text = article.desc;
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showArticle"]) {
        UINavigationController *navigationController = (UINavigationController*)segue.destinationViewController;
        ArticleDetailViewController *detailVC = (ArticleDetailViewController*)navigationController.topViewController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        detailVC.article = self.articles[indexPath.row];
        detailVC.navigationItem.leftBarButtonItem = [self.splitViewController displayModeButtonItem];
        detailVC.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

@end
