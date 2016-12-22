//
//  XCNetworkTool.m
//  XCDetailPage
//
//  Created by zhangyu on 2016/12/22.
//  Copyright © 2016年 zhangyu. All rights reserved.
//

#import "XCNetworkTool.h"

@implementation XCNetworkTool
+ (instancetype)sharedNetworkTool
{
    static XCNetworkTool *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // 设置相对路径
        NSURL *BaseURL = [NSURL URLWithString:@"http://106.14.38.94/xinchengapi/index.php/Api/newsinfo?n_id=5"];
        // 实例化Manager
        instance = [[self alloc] initWithBaseURL:BaseURL];
        
        // 增加AFN支持的文件类型
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
    });
    
    return instance;
}

// 网络工具类实现GET请求
- (void)GETWithURLString:(NSString *)URLString success:(void (^)(id))success faile:(void (^)(NSError *))faile
{
    [self GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // AFN的回调
        
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (faile) {
            faile(error);
        }
    }];
}
@end
