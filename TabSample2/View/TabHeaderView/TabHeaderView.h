//
//  TabHeaderView.h
//  KeimaTabSample
//
//  Created by 古澤 伸一 on 2014/12/25.
//  Copyright (c) 2014年 古澤 伸一. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabHeaderButton.h"

@protocol TabHeaderViewDelegate <NSObject>

- (void)setPage:(NSInteger)page;

@end

@interface TabHeaderView : UIView <TabHeaderButtonDelegate>

@property (nonatomic) NSInteger page;
@property (nonatomic) NSMutableArray *views;
@property (nonatomic) NSArray *tabs;
@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic, weak) id<TabHeaderViewDelegate>  delegate;

- (void)addWithTitle:(NSString *)title;

@end
