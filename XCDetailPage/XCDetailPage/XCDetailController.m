//
//  XCDetailController.m
//  XCDetailPage
//
//  Created by zhangyu on 2016/12/21.
//  Copyright © 2016年 zhangyu. All rights reserved.
//

#import "XCDetailController.h"
#import <Masonry.h>
#import "XCDetailTitleView.h"
#import "XCDetailContentCell.h"
#import "XCNetworkTool.h"
#import "XCDetailModel.h"
#import <YYModel.h>

static NSString *cellId = @"cellId";

static NSString *identifier = @"XCDetailContentCell";

@interface XCDetailController ()<UITableViewDelegate,UITableViewDataSource>
//相关内容列表
@property (weak, nonatomic) UITableView *relateTabelView;
//左侧详情列表
@property (weak, nonatomic) UITableView *detailTabelView;

@property (nonatomic, strong)  XCDetailContentCell *prototypeCell;

@end

@implementation XCDetailController {
    /// 数据源数组
    NSArray *_detailCellList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    _URLString = @"";
    [self setURLString:_URLString];
}
/// 新闻控制器拿到新闻数据的地址
- (void)setURLString:(NSString *)URLString
{
    
    // 使用地址发送网络请求
    [self loadNewsData];
}

#pragma mark — 详情控制器加载详情数据的主方法
- (void)loadNewsData
{
    [[XCNetworkTool sharedNetworkTool] GETWithURLString:_URLString success:^(NSDictionary *responseObject) {
        
        NSString *key = @"data";
        NSString *key1 = @"content";
        // 取出字典数组
        NSDictionary *newsList1 = responseObject[key];
        NSArray *newsList = newsList1[key1];
        
        // 使用YYModel把字典数组转成模型数组
        _detailCellList = [NSArray yy_modelArrayWithClass:[XCDetailModel class] json:newsList];
                NSLog(@"%@----------%@",responseObject[key],_detailCellList);
        // 刷新列表
        [self.detailTabelView reloadData];
        
    } faile:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}
#pragma mark - 搭建界面
- (void)setupUI {
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    // MARK: - 1.右侧的相关内容列表视图
    UITableView *relateTabelView = [[UITableView alloc] init];
    [self.view addSubview:relateTabelView];
    
    [relateTabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.top.bottom.equalTo(self.view);
        make.width.mas_equalTo(150);
        
    }];

    // MARK: - 2.左侧的详情列表视图
    UITableView *detailTabelView = [[UITableView alloc] init];
    
    [self.view addSubview:detailTabelView];
    
    [detailTabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.bottom.equalTo(relateTabelView);
        make.left.equalTo(self.view);
        make.right.equalTo(relateTabelView.mas_left);
        
    }];
    // MARK: -----设置列表的属性-------
    relateTabelView.dataSource = self;
    relateTabelView.delegate = self;
    
    detailTabelView.dataSource = self;
    detailTabelView.delegate = self;
    
    //注册cell
//    [relateTabelView registerClass:[RelateTableViewCell class] forCellReuseIdentifier:cellId];
    [relateTabelView registerNib:[UINib nibWithNibName:@"XCDetailContentCell" bundle:nil] forCellReuseIdentifier:identifier];
    [detailTabelView registerNib:[UINib nibWithNibName:@"XCDetailContentCell" bundle:nil] forCellReuseIdentifier:identifier];
    
    
//    self.prototypeCell = [self.detailTabelView dequeueReusableCellWithIdentifier:identifier];
    detailTabelView.sectionHeaderHeight = 100;
    
    //不显示多余的行
    relateTabelView.tableFooterView = [[UIView alloc] init];
    detailTabelView.tableFooterView = [[UIView alloc] init];
    
    //隐藏指示条子
    relateTabelView.showsVerticalScrollIndicator = NO;
    detailTabelView.showsVerticalScrollIndicator = NO;
    
    //设置行高
    relateTabelView.rowHeight = 55;
    detailTabelView.rowHeight = 400;
    
    // MARK: ----设置预估行高!
    detailTabelView.estimatedRowHeight = 400;
    detailTabelView.rowHeight = UITableViewAutomaticDimension;
    
    
    //取消分割线
    relateTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    detailTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // MARK: - 记录成员变量
    _detailTabelView = detailTabelView;
    _relateTabelView = relateTabelView;
    // MARK:添加headerView
    self.detailTabelView.tableHeaderView = [[XCDetailTitleView alloc]initWithFrame:CGRectMake(0, 0, self.detailTabelView.bounds.size.width, 116)];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _detailCellList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    XCDetailModel *detailModel = _detailCellList[indexPath.row];
    
    XCDetailContentCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    //MARK: - 取消cell点击效果
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.detailModel = detailModel;
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //    DetailModel *model = [_newsList objectAtIndex:indexPath.row];
    //    return model.detailLabelHeight + 30;
    return 150;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.f;
}

@end
