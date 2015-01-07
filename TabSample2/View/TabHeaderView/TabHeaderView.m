//
//  TabHeaderView.m
//  KeimaTabSample
//
//  Created by 古澤 伸一 on 2014/12/25.
//  Copyright (c) 2014年 古澤 伸一. All rights reserved.
//

#define TABWIDTH 100

#import "TabHeaderView.h"

@implementation TabHeaderView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) [self initialization];
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) [self initialization];
    return self;
}

- (void)initialization {
    _views = [NSMutableArray array];
    _scrollView = [[UIScrollView alloc]init];
    [self addSubview:_scrollView];
}

- (void)layoutSubviews {
    //サブビューのフレームはここで調節した方がよい。
    _scrollView.frame = self.bounds;
    _scrollView.showsHorizontalScrollIndicator = NO;
}

- (void)setTabs:(NSArray *)tabs {
    for (NSString *title in tabs) {
        [self addWithTitle:title];
    }
    _tabs = tabs;
}

- (void)addWithTitle:(NSString *)title {
    
    //カスタムクラス
    TabHeaderButton *button = [[TabHeaderButton alloc]init];
    button.title = title;
    button.delegate = self;

    [_views addObject:button];
    [_scrollView addSubview:button];
    [self adjust];
    NSLog(@"yobaretayo!!");

}

- (void)adjust {
    for (int i = 0; i<_views.count; i++) {
        TabHeaderButton *button = _views[i];
        button.frame = CGRectMake(i*(TABWIDTH+2), 0, TABWIDTH, self.bounds.size.height);
        button.page = i;
        button.selected = (i == _page);
    }
    _scrollView.contentSize = CGSizeMake((TABWIDTH+2)*_views.count, self.bounds.size.height);
    TabHeaderButton *button = _views[_page];
    CGFloat x = button.center.x-self.bounds.size.width/2;
    x = MIN(MAX(x, 0), _scrollView.contentSize.width - _scrollView.bounds.size.width);
    [_scrollView setContentOffset:CGPointMake(x-1, 0.0f) animated:YES];
}

- (void)setPage:(NSInteger)page {
    if(_page==page)return;
    _page = page;
    [self.delegate setPage:_page];
    [self adjust];
    NSLog(@"pageがセットされたよ！");
    NSLog(@"%ld",(long)_page);
}



@end
