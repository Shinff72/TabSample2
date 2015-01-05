//
//  TabHeaderButton.h
//  KeimaTabSample
//
//  Created by 古澤 伸一 on 2014/12/25.
//  Copyright (c) 2014年 古澤 伸一. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TabHeaderButtonDelegate <NSObject>

- (void)setPage:(NSInteger)page;

@end

@interface TabHeaderButton : UIView

@property (nonatomic) NSString *title;
@property (nonatomic) NSInteger page;
@property (nonatomic) BOOL selected;
@property (nonatomic) id<TabHeaderButtonDelegate>  delegate;


@end
