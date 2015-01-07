//
//  homeTableViewController.m
//  millionArthurInvation
//
//  Created by 古澤 伸一 on 2014/12/17.
//  Copyright (c) 2014年 古澤 伸一. All rights reserved.
//

#import "homeTableViewController.h"
#import "homeTableViewCell.h"
#import "Item.h"
#import "webViewController.h"
#import "AppDelegate.h"


@interface homeTableViewController ()

@end

@implementation homeTableViewController {
    NSDate *date;
}

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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSUInteger count = _tableItems.count;
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = @"homeTableViewCell";
    homeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    NSSortDescriptor* dec = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO];
    _tableItems = [_tableItems sortedArrayUsingDescriptors:[NSMutableArray arrayWithObject:dec]];
    
    Item *item = _tableItems[indexPath.row];
    
    item.title = [item.title stringByReplacingOccurrencesOfString:@"【テラバトル】" withString:@""];
    cell.titleLabel.text = item.title;
    
    NSDateFormatter* formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"en_US"];
    date = [formatter dateFromString:item.date];//④日付追加
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [format setDateFormat:@"yyyy/MM/dd"];
    cell.dateLabel.text = [format stringFromDate:date];

    cell.blogLabel.text = item.blog;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"タップされたよ！");
    
        webViewController *webViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"webViewController"];
        webViewController.item = _tableItems[indexPath.row];
        [self.navigationController pushViewController:webViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
