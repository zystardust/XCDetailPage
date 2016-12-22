//
//  XCDetailContentCell.m
//  XCDetailPage
//
//  Created by zhangyu on 2016/12/22.
//  Copyright © 2016年 zhangyu. All rights reserved.
//

#import "XCDetailContentCell.h"
#import <UIImageView+WebCache.h>
@interface XCDetailContentCell ()

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;

@end
@implementation XCDetailContentCell

- (void)setDetailModel:(XCDetailModel *)detailModel
{
    _detailModel = detailModel;
    self.contentLabel.text = detailModel.text;
    
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
