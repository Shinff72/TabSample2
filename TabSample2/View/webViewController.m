//
//  webViewController.m
//  millionArthurInvation
//
//  Created by 古澤 伸一 on 2014/12/18.
//  Copyright (c) 2014年 古澤 伸一. All rights reserved.
//

#import "webViewController.h"

@interface webViewController ()

@end

@implementation webViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:_item.url];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:req];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
