//
//  homeTableViewController.h
//  millionArthurInvation
//
//  Created by 古澤 伸一 on 2014/12/17.
//  Copyright (c) 2014年 古澤 伸一. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"
#import "webViewController.h"
#import "callClass.h"


@interface homeTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, CallClassDelegate>


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,retain) NSMutableArray *tableItems; //受け取りプロパティ


@end
