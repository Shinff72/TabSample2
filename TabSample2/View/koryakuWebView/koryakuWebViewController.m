//
//  koryakuWebViewController.m
//  TabSample2
//
//  Created by 古澤 伸一 on 2015/01/06.
//  Copyright (c) 2015年 古澤 伸一. All rights reserved.
//

#import "koryakuWebViewController.h"

@interface koryakuWebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation koryakuWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http://ohako-inc.jp"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:req];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
