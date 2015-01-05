//
//  officalWebViewController.m
//  millionArthurInvation
//
//  Created by 古澤 伸一 on 2014/12/17.
//  Copyright (c) 2014年 古澤 伸一. All rights reserved.
//

#import "officalWebViewController.h"

@interface officalWebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation officalWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http://portal.million-arthurs.com/kairi/"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:req];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
