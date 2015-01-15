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
//    [self fetchRSS1];
//    [self fetchRSS2];
    [self fetchRSS3];
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
             
             NSString *str = dict[@"published"][@"text"];
                 NSDateFormatter* formatter = [NSDateFormatter new];
                 formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
                 formatter.timeZone = [NSTimeZone timeZoneWithName:@"en_US"];
             item.date = [formatter dateFromString:str];//④日付追加
             
             item.url = dict[@"link"][@"href"];
             item.blog = @"テラバトル攻略まとめWiki - GAMY";
             
//             NSLog(@"%@",item.title);
//             NSLog(@"%@",item.date);
//             NSLog(@"URL___%@",item.url);
             
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
             item.url = dict[@"link"][@"href"];
             item.blog = @"ガールフレンド（仮）完全攻略図鑑 - GAMY";
             
//             NSLog(@"%@",item.title);
//             NSLog(@"%@",item.date);
//             NSLog(@"URL___%@",item.url);

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
             item.url = dict[@"link"][@"href"];
             item.blog = @"白猫プロジェクト（白プロ）攻略まとめWiki - GAMY";
             
             
             //             NSLog(@"%@",item.title);
             //             NSLog(@"%@",item.date);
             //             NSLog(@"URL___%@",item.url);
             
             [items addObject:item];
             
             
         }
         
         AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate]; // デリゲート呼び出し
         appDelegate.RSSItems = items; // デリゲートプロパティに値代入
         
         [self.delegate callSuccess];
         
     }];
    
}

- (void)fetchRSS3 {
    
    NSURL *url = [NSURL URLWithString:@"http://daikin-trading.com/feed"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:queue
                           completionHandler:
     ^(NSURLResponse *response, NSData *data, NSError *error){
         
         NSDictionary *dict = [XMLReader dictionaryForXMLData:data
                                                      options:XMLReaderOptionsProcessNamespaces
                                                        error:&error];
         
         
         
         NSArray *entry = dict[@"rss"][@"channel"][@"item"];
         
         for (NSDictionary *dict in entry) {
             
             Item *item = [[Item alloc] init];
             item.title = dict[@"title"][@"text"];
             
             NSString *str =dict[@"pubDate"][@"text"];
             str = [self replaceMonth:str];
             str = [self replaceDay:str];
             NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
             formatter.dateFormat = @"dd MM yyyy HH:mm:ss ZZ";
             formatter.timeZone = [NSTimeZone timeZoneWithName:@"en_US"];
             NSDate *pubDate = [formatter dateFromString:str];

             item.date = pubDate;

             item.url = dict[@"link"][@"text"];
             item.blog = @"aaaaaaaaaaaa";
             item.thumbnailURL = dict[@"encoded"][@"text"];
             
//                          NSLog(@"%@",item.title);
//                          NSLog(@"%@",item.date);
//                          NSLog(@"URL___%@",item.url);
             
             [items addObject:item];
             
             
         }
         
         AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate]; // デリゲート呼び出し
         appDelegate.RSSItems = items; // デリゲートプロパティに値代入
         
         [self.delegate callSuccess];
         
     }];
}

- (NSString *)replaceMonth:(NSString *)string
{
    string = [string stringByReplacingOccurrencesOfString:@"Jan" withString:@"01"];
    string = [string stringByReplacingOccurrencesOfString:@"Feb" withString:@"02"];
    string = [string stringByReplacingOccurrencesOfString:@"Mar" withString:@"03"];
    string = [string stringByReplacingOccurrencesOfString:@"Apr" withString:@"04"];
    string = [string stringByReplacingOccurrencesOfString:@"May" withString:@"05"];
    string = [string stringByReplacingOccurrencesOfString:@"Jun" withString:@"06"];
    string = [string stringByReplacingOccurrencesOfString:@"Jul" withString:@"07"];
    string = [string stringByReplacingOccurrencesOfString:@"Aug" withString:@"08"];
    string = [string stringByReplacingOccurrencesOfString:@"Sep" withString:@"09"];
    string = [string stringByReplacingOccurrencesOfString:@"Oct" withString:@"10"];
    string = [string stringByReplacingOccurrencesOfString:@"Nov" withString:@"11"];
    string = [string stringByReplacingOccurrencesOfString:@"Dec" withString:@"12"];
    return string;
}

- (NSString *)replaceDay:(NSString *)string {
    string = [string stringByReplacingOccurrencesOfString:@"Sun, " withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"Mon, " withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"Tue, " withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"Wed, " withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"Thu, " withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"Fri, " withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"Sat, " withString:@""];
    return string;
}

@end
