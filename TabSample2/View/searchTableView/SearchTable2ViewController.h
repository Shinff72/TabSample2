//
//  ViewController.h
//  UITableViewCustomCellSample
//
//  Created by yasuhisa.arakawa on 2014/04/12.
//  Copyright (c) 2014年 Yasuhisa Arakawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "callClass.h"
#import "Item.h"
#import "AppDelegate.h"

@interface SearchTable2ViewController : UIViewController<CallClassDelegate>

@property (nonatomic) NSArray *tableItems;
@property (nonatomic) NSArray *tableItemsResult;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic) NSInteger page;


@end

