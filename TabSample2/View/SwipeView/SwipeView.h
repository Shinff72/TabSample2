//
//  SwipeView.h
//  TabSample2
//
//  Created by 古澤 伸一 on 2015/01/05.
//  Copyright (c) 2015年 古澤 伸一. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SwipeViewDelegate <NSObject>

- (void)setPage:(NSInteger)page;

@end

@interface SwipeView : UIScrollView <UIScrollViewDelegate>

@property (nonatomic) NSInteger page;
@property (nonatomic, weak) id<SwipeViewDelegate> swipeViewDelegate;

@end
