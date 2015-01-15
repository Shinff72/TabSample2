//
//  ViewController.m
//  UITableViewCustomCellSample
//
//  Created by yasuhisa.arakawa on 2014/04/12.
//  Copyright (c) 2014年 Yasuhisa Arakawa. All rights reserved.
//

#import "SearchTable2ViewController.h"
#import "SearchTableViewCell.h"
#import "TableViewConst.h"

/**
 *  テーブルビューのセクション数が入ります。
 */

@interface SearchTable2ViewController ()<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate>


@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSIndexPath *selectedIndexPath;

@end

@implementation SearchTable2ViewController

#pragma mark - Lifecycle methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.searchDisplayController.delegate = self;
        
    self.tableItems = @[];
    self.tableItemsResult = @[];
    
    
    // カスタマイズしたセルをテーブルビューにセット
    [self.searchDisplayController.searchResultsTableView registerNib:[UINib nibWithNibName:TableViewCustomCellIdentifier bundle:nil] forCellReuseIdentifier:@"Cell"];
    
    callClass *cc = [[callClass alloc] init]; // クラス呼び出し
    cc.delegate = self;
    [cc CallMethod]; // メソッド呼び出し
}

- (void)callSuccess
{
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate]; // デリゲート呼び出し
    self.tableItems = appDelegate.RSSItems; // 代入
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.01 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (_selectedIndexPath) {
        [self.tableView deselectRowAtIndexPath:_selectedIndexPath animated:YES];
    }
    
    if (self.searchDisplayController.isActive) {
        [self.searchDisplayController.searchResultsTableView deselectRowAtIndexPath:_selectedIndexPath animated:YES];
    }
}

#pragma mark - UITableViewDataSource delegate methods


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger dataCount;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        dataCount = self.tableItemsResult.count;
    } else {
        dataCount = self.tableItemsResult.count;
    }
    return dataCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    Item *item;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        item = _tableItemsResult[indexPath.row];
    } else {
        item = _tableItemsResult[indexPath.row];
    }
    cell.titleLabel.text = item.title;
    cell.imageThumb.image = [UIImage imageNamed:@"ios1-100x100"];
    cell.blogLabel.text = item.blog;
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [format setDateFormat:@"yyyy/MM/dd"];
    cell.dateLabel.text = [format stringFromDate:item.date];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}






#pragma mark - UISearchDisplayDelegate method

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContainsWithSearchText:searchString];
    return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
}

- (void)searchBar:(UISearchBar *)searchBar
    textDidChange:(NSString *)searchText {
    [self filterContainsWithSearchText:searchText];
    [_tableView reloadData];
    [searchBar resignFirstResponder];

}

- (void):(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

#pragma mark - Private method

- (void)filterContainsWithSearchText:(NSString *)searchText
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.title contains[c] %@", searchText];
    self.tableItemsResult = [_tableItems filteredArrayUsingPredicate:predicate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
