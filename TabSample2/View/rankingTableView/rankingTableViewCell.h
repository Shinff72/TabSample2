//
//  rankingTableViewCell.h
//  millionArthurInvation
//
//  Created by 古澤 伸一 on 2014/12/17.
//  Copyright (c) 2014年 古澤 伸一. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface rankingTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *blogLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageLabel;

@end
