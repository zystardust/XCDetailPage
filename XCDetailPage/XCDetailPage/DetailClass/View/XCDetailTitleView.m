//
//  XCDetailTitleView.m
//  XCDetailPage
//
//  Created by zhangyu on 2016/12/22.
//  Copyright © 2016年 zhangyu. All rights reserved.
//

#import "XCDetailTitleView.h"
@interface XCDetailTitleView ()
@property(strong,nonatomic)UILabel *BqLabel;
@property(strong,nonatomic)UILabel *FbtLabel;
@property(strong,nonatomic)UILabel *DbtLabel;
@property(strong,nonatomic)UILabel *XbqLabel;
@end
@implementation XCDetailTitleView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _BqLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, 120, 10)];
        _BqLabel.text = @"人工智能/眼球追踪";
        _BqLabel.textAlignment = NSTextAlignmentLeft;
        _BqLabel.font = [UIFont systemFontOfSize:8];
        
        _FbtLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 43, 120, 12)];
        _FbtLabel.text = @"谷歌再探索";
        _FbtLabel.textAlignment = NSTextAlignmentLeft;
        _FbtLabel.font = [UIFont systemFontOfSize:12];
        
        _DbtLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 60, 500, 18)];
        _DbtLabel.text = @"看一看谷歌研发的机器人与黑科技";
        _DbtLabel.textAlignment = NSTextAlignmentLeft;
        _DbtLabel.font = [UIFont systemFontOfSize:18];
        
        
        _XbqLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 93, 200, 18)];
        _XbqLabel.text = @"谷歌  BEME  CNN";
        _XbqLabel.textAlignment = NSTextAlignmentLeft;
        _XbqLabel.font = [UIFont systemFontOfSize:8];
        
        [self addSubview:_BqLabel];
        [self addSubview:_FbtLabel];
        [self addSubview:_DbtLabel];
        [self addSubview:_XbqLabel];
    }
    return self;
}


@end
