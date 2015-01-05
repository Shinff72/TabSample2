//
//  searchTableViewController.h
//  millionArthurInvation
//
//  Created by 古澤 伸一 on 2014/12/17.
//  Copyright (c) 2014年 古澤 伸一. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"
#import "webViewController.h"
#import "callClass.h"


@interface searchTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property(nonatomic,retain) NSMutableArray *tableItems; //受け取りプロパティ


@end
