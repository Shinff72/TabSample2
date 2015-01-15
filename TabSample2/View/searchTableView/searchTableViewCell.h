//
//  CustomTableViewCell.h
//  UITableViewCustomCellSample
//
//  Created by yasuhisa.arakawa on 2014/04/14.
//  Copyright (c) 2014年 Yasuhisa Arakawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageThumb;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *blogLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;


+ (CGFloat)rowHeight;

@end
