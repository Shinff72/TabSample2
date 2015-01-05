//
//  callClass.m
//  testNSJSONandAppDelegate
//
//  Created by 古澤 伸一 on 2014/12/24.
//  Copyright (c) 2014年 古澤 伸一. All rights reserved.
//

#import "callClass.h"
#import "AppDelegate.h"
#import "XMLReader.h"

@implementation callClass
{
    NSMutableArray *items;
}

// これを呼び出してみる
- (void)CallMethod
{
    [self fetchRSS];
    [self fetchRSS1];
    [self fetchRSS2];
    items = [NSMutableArray array];
    NSLog(@"CallMethod読み出し");
}

- (void)fetchRSS {
    
    NSURL *url = [NSURL URLWithString:@"http://gamy.jp/terra-battle/feed"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:queue
                           completionHandler:
     ^(NSURLResponse *response, NSData *data, NSError *error){
         
         NSDictionary *dict = [XMLReader dictionaryForXMLData:data
                                                      options:XMLReaderOptionsProcessNamespaces
                                                        error:&error];
         
         
         
         NSArray *entry = dict[@"feed"][@"entry"];
         
         for (NSDictionary *dict in entry) {
             
             Item *item = [[Item alloc] init];
             item.title = dict[@"title"][@"text"];
             item.date = dict[@"published"][@"text"];
             
             NSLog(@"%@",item.title);
             NSLog(@"%@",item.date);
             
             [items addObject:item];
             
             
         }
         
         AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate]; // デリゲート呼び出し
         appDelegate.RSSItems = items; // デリゲートプロパティに値代入
         
         [self.delegate callSuccess];
         
     }];
    
}

- (void)fetchRSS1 {
    
    NSURL *url = [NSURL URLWithString:@"http://gamy.jp/girlfriend-kari/feed"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:queue
                           completionHandler:
     ^(NSURLResponse *response, NSData *data, NSError *error){
         
         NSDictionary *dict = [XMLReader dictionaryForXMLData:data
                                                      options:XMLReaderOptionsProcessNamespaces
                                                        error:&error];
         
         
         
         NSArray *entry = dict[@"feed"][@"entry"];
         
         for (NSDictionary *dict in entry) {
             
             Item *item = [[Item alloc] init];
             item.title = dict[@"title"][@"text"];
             item.date = dict[@"published"][@"text"];
             
             NSLog(@"%@",item.title);
             NSLog(@"%@",item.date);
             
             [items addObject:item];
             
             
         }
         
         AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate]; // デリゲート呼び出し
         appDelegate.RSSItems = items; // デリゲートプロパティに値代入
         
         [self.delegate callSuccess];
         
     }];
    
}

- (void)fetchRSS2 {
    
    NSURL *url = [NSURL URLWithString:@"http://gamy.jp/shironekoproject/feed"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:queue
                           completionHandler:
     ^(NSURLResponse *response, NSData *data, NSError *error){
         
         NSDictionary *dict = [XMLReader dictionaryForXMLData:data
                                                      options:XMLReaderOptionsProcessNamespaces
                                                        error:&error];
         
         
         
         NSArray *entry = dict[@"feed"][@"entry"];
         
         for (NSDictionary *dict in entry) {
             
             Item *item = [[Item alloc] init];
             item.title = dict[@"title"][@"text"];
             item.date = dict[@"published"][@"text"];
             
             NSLog(@"%@",item.title);
             NSLog(@"%@",item.date);
             
             [items addObject:item];
             
             
         }
         
         AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate]; // デリゲート呼び出し
         appDelegate.RSSItems = items; // デリゲートプロパティに値代入
                  
         [self.delegate callSuccess];
         
     }];
    
}

@end
