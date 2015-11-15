//
//  ArticleListViewController.m
//  Reader
//
//  Created by Antti Ahvenlampi on 13/11/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

#import "ArticleListViewController.h"

#import "ArticleListViewModel.h"
#import "ArticleViewModel.h"
#import "ArticleDetailViewController.h"
#import "ArticleCell.h"

#import "NSURLSession+NetworkService.h"

@interface ArticleListViewController ()

@property (nonatomic, strong) ArticleListViewModel *viewModel;

@end

@implementation ArticleListViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        _viewModel = [[ArticleListViewModel alloc] initWithNetworkService:[NSURLSession sharedSession]];
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 120;
    
    __weak ArticleListViewController *weakSelf = self;
    [self.viewModel loadWithCompletion:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            ArticleListViewController *strongSelf = weakSelf;
            [strongSelf.tableView reloadData];
        });
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(__unused UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(__unused UITableView *)tableView numberOfRowsInSection:(__unused NSInteger)section {
    return (NSInteger)[self.viewModel.articles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ArticleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"articleCell" forIndexPath:indexPath];
    
    // Get the relevant article
    ArticleViewModel *article = self.viewModel.articles[indexPath.row];
    
    // Configure the cell content
    cell.titleLabel.text = article.title;
    cell.descriptionLabel.text = article.publishedSince;
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showArticle"]) {
        UINavigationController *navigationController = (UINavigationController*)segue.destinationViewController;
        ArticleDetailViewController *detailVC = (ArticleDetailViewController*)navigationController.topViewController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        detailVC.article = self.viewModel.articles[indexPath.row];
        detailVC.navigationItem.leftBarButtonItem = [self.splitViewController displayModeButtonItem];
        detailVC.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

@end
