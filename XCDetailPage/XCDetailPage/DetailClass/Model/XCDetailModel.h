//
//  XCDetailModel.h
//  XCDetailPage
//
//  Created by zhangyu on 2016/12/22.
//  Copyright © 2016年 zhangyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XCDetailModel : NSObject
/// 新闻标题
@property (copy, nonatomic) NSString *text;
/// 图片的地址
@property (copy, nonatomic) NSArray *gp;



//@property(nonatomic, assign) CGFloat detailLabelHeight;//自适应行高

@end
