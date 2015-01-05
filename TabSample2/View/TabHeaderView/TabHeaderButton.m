//
//  TabHeaderButton.m
//  ShinichiTabSample
//
//  Created by 古澤 伸一 on 2014/12/25.
//  Copyright (c) 2014年 古澤 伸一. All rights reserved.
//

#import "TabHeaderButton.h"

@implementation TabHeaderButton{
    __strong UILabel *titleLabel;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) [self initialization];
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) [self initialization];
    return self;
}

- (void)initialization {
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(view_Tapped:)];
    [self addGestureRecognizer:tapGesture];
    titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    [self addSubview:titleLabel];
    self.selected = NO;
    
}

- (void)view_Tapped:(UITapGestureRecognizer *)sender
{
    [self.delegate setPage:_page];
}

- (void)setTitle:(NSString *)title {
    titleLabel.text = title;
    _title = title;
}

- (void)setSelected:(BOOL)selected {
    if (selected) {
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.6];
    } else {
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.2];
    }
    _selected = selected;
}

@end

