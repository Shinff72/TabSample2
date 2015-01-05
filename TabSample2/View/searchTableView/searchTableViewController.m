//

//  searchTableViewController.m

//  millionArthurInvation

//

//  Created by 古澤 伸一 on 2014/12/17.

//  Copyright (c) 2014年 古澤 伸一. All rights reserved.

//



#import "searchTableViewController.h"
#import "searchTableViewCell.h"
#import "Item.h"
#import "webViewController.h"
#import "AppDelegate.h"


@interface searchTableViewController ()

@property (nonatomic, strong) NSArray *dataSourceSearchResults;

@end

@implementation searchTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    callClass *cc = [[callClass alloc] init]; // クラス呼び出し
    cc.delegate = self;
    [cc CallMethod]; // メソッド呼び出し}
}

- (void)callSuccess
{
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate]; // デリゲート呼び出し
    _tableItems = appDelegate.RSSItems; // 代入
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        count = self.dataSourceSearchResults.count;
    } else {
    count = _tableItems.count;
    }
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = @"searchTableViewCell";
    searchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
//        NSSortDescriptor* dec = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO];
//        _dataSourceSearchResults = [_dataSourceSearchResults sortedArrayUsingDescriptors:[NSMutableArray arrayWithObject:dec]];
//        
//        Item *item = _dataSourceSearchResults[indexPath.row];
//        
//        
//        item.title = [item.title stringByReplacingOccurrencesOfString:@"【テラバトル】" withString:@""];
//        cell.titleLabel.text = item.title;
//        
//        NSDateFormatter *format = [[NSDateFormatter alloc] init];
//        [format setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
//        [format setDateFormat:@"yyyy/MM/dd"];
//        
//        cell.dateLabel.text = [format stringFromDate:item.date];
    } else {
    
    NSSortDescriptor* dec = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO];
    _tableItems = [_tableItems sortedArrayUsingDescriptors:[NSMutableArray arrayWithObject:dec]];
    
    Item *item = _tableItems[indexPath.row];
    
    item.title = [item.title stringByReplacingOccurrencesOfString:@"【テラバトル】" withString:@""];
    cell.titleLabel.text = item.title;
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [format setDateFormat:@"yyyy/MM/dd"];
    
    cell.dateLabel.text = [format stringFromDate:item.date];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"タップされたよ！");
    
    //    webViewController *webViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"webViewController"];
    //    webViewController.item = _RSSItems[indexPath.row];
    //    [self.navigationController pushViewController:webViewController animated:YES];
}

- (void)filterContainsWithSearchText:(NSString *)searchText
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@", searchText];
    
    self.dataSourceSearchResults = [_tableItems filteredArrayUsingPredicate:predicate];
}

- (BOOL)searchDisplayController:controller shouldReloadTableForSearchString:(NSString *)searchString
{
    // 検索バーに入力された文字列を引数に、絞り込みをかけます
    [self filterContainsWithSearchText:searchString];
    
    // YESを返すとテーブルビューがリロードされます。
    // リロードすることでdataSourceSearchResultsiPhoneとdataSourceSearchResultsAndroidからテーブルビューを表示します
    [self.tableView reloadData];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
