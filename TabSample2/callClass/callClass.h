//
//  callClass.h
//  testNSJSONandAppDelegate
//
//  Created by 古澤 伸一 on 2014/12/24.
//  Copyright (c) 2014年 古澤 伸一. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"


@protocol CallClassDelegate <NSObject>
-(void)callSuccess;
@end

@interface callClass : NSObject <NSXMLParserDelegate>

{
    NSXMLParser *_parser;
    NSString *_elementName;
    NSArray *_resultNodes;
    Item *RSSitem;
    NSMutableArray *Items;
}

- (void)CallMethod;
@property (nonatomic) id<CallClassDelegate> delegate;


@end
