//
//  ViewController.h
//  TabSample2
//
//  Created by 古澤 伸一 on 2015/01/05.
//  Copyright (c) 2015年 古澤 伸一. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabHeaderView.h"

@interface ViewController : UIViewController <TabHeaderViewDelegate>

@property (nonatomic) NSInteger page;
@property (nonatomic) NSArray *tabs;

@end
