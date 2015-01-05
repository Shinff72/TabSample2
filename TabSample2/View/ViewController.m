//
//  ViewController.m
//  TabSample2
//
//  Created by 古澤 伸一 on 2015/01/05.
//  Copyright (c) 2015年 古澤 伸一. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    
    __weak IBOutlet TabHeaderView *tabHeaderView;
    __weak IBOutlet SwipeView *swipeView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    tabHeaderView.delegate = self;
    swipeView.swipeViewDelegate = self;
    
    _tabs = @[@"最新情報",
              @"ランキング",
              @"公式",
              @"検索",
              @"設定"];
    
    tabHeaderView.tabs = _tabs;
}

- (void)setPage:(NSInteger)page {
    if(_page==page)return;
//    testLabel.text = [NSString stringWithFormat:@"%ld",(long)page];
    _page = page;
    swipeView.page = _page;
    tabHeaderView.page = _page;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
