//
//  ListTableViewCell.m
//  DPRead
//
//  Created by shan on 2017/1/22.
//  Copyright © 2017年 sahn. All rights reserved.
//

#import "ListTableViewCell.h"

@implementation ListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
