//
//  webViewController.h
//  millionArthurInvation
//
//  Created by 古澤 伸一 on 2014/12/18.
//  Copyright (c) 2014年 古澤 伸一. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@interface webViewController : UIViewController

@property (nonatomic) Item *item;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
