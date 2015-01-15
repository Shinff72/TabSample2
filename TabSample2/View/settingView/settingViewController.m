//
//  settingViewController.m
//  millionArthurInvation
//
//  Created by 古澤 伸一 on 2014/12/17.
//  Copyright (c) 2014年 古澤 伸一. All rights reserved.
//

#import "settingViewController.h"
#import "Item.h"

@interface settingViewController ()
@property (nonatomic) NSMutableArray *items;

@end

@implementation settingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _items = [NSMutableArray array];
    
    Item *item = [[Item alloc] init];
    item.title = @"利用規約";
    item.url = [[NSBundle mainBundle] pathForResource:@"kiyaku" ofType:@"html" inDirectory:@"www"];
    [_items addObject:item];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Item *item = [[Item alloc] init];
    NSString *cellIdentifier = @"settingTableViewCell";
    settingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    item = [_items objectAtIndex:indexPath.row];
    cell.titleLabel.text = item.title;
    tableView.scrollEnabled = NO;
    return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    webViewController *webViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"webViewController"];
    webViewController.item = _items[indexPath.row];
    [self.navigationController pushViewController:webViewController animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
