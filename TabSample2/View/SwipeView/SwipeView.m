//
//  SwipeView.m
//  TabSample2
//
//  Created by 古澤 伸一 on 2015/01/05.
//  Copyright (c) 2015年 古澤 伸一. All rights reserved.
//

#import "SwipeView.h"

@implementation SwipeView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.delegate = self;
}

- (void)setPage:(NSInteger)page {
    if (page == _page)return;
    _page = page;
    [self.swipeViewDelegate setPage:_page];
    [self adjust];
}

- (void)adjust {
    CGFloat x = self.bounds.size.width*_page;
    [self setContentOffset:CGPointMake(x, 0.0f) animated:YES];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    float a = ((int)scrollView.contentOffset.x % (int)self.bounds.size.width );
    if (a == 0) {
        self.page = scrollView.contentOffset.x / self.bounds.size.width;
    }
}


@end
