//
//  XCDetailController.m
//  XCDetailPage
//
//  Created by zhangyu on 2016/12/21.
//  Copyright © 2016年 zhangyu. All rights reserved.
//

#import "XCDetailController.h"
#import <Masonry.h>

@interface XCDetailController ()<UITableViewDelegate,UITableViewDataSource>
//相关内容列表
@property (weak, nonatomic) UITableView *relateTabelView;
//左侧详情列表
@property (weak, nonatomic) UITableView *detailTabelView;

@end

@implementation XCDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}
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
    
    // 2.注册cell
//    [relateTabelView registerClass:[RelateTableViewCell class] forCellReuseIdentifier:cellId];
//    [detailTabelView registerNib:[UINib nibWithNibName:@"DetailCell" bundle:nil] forCellReuseIdentifier:identifier];
    
    // 注册header! -> 负责注册tableView的组标题视图的!
    // 类型-> 继承自UITaleViewHeaderFooterView!
//    [detailTabelView registerClass:[DetailTitleHeaderView class] forHeaderFooterViewReuseIdentifier:headerId];
    ///warning - 一定要设置这个属性,才会调用对应的代理方法
    detailTabelView.sectionHeaderHeight = 100;//23;
    
    // 3.不显示多余的行
    relateTabelView.tableFooterView = [[UIView alloc] init];
    detailTabelView.tableFooterView = [[UIView alloc] init];
    
    // 4.隐藏指示条子
    relateTabelView.showsVerticalScrollIndicator = NO;
    detailTabelView.showsVerticalScrollIndicator = NO;
    
    // 5.设置行高
    relateTabelView.rowHeight = 55;
    detailTabelView.rowHeight = 400;
    
    // MARK: ----设置预估行高!
    detailTabelView.estimatedRowHeight = 400;
    detailTabelView.rowHeight = UITableViewAutomaticDimension;
    
    
    // 6.取消分割线
    relateTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    detailTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // MARK: - 4.记录成员变量
    _detailTabelView = detailTabelView;
    _relateTabelView = relateTabelView;
    
//    ContentView *cView = [[ContentView alloc]initWithFrame:CGRectMake(0, 116, 164, 164)];
//    cView.backgroundColor = [UIColor whiteColor];
//    [self.detailTabelView addSubview:cView];
//    
//    self.detailTabelView.tableHeaderView = [[titleView alloc]initWithFrame:CGRectMake(0, 0, self.detailTabelView.bounds.size.width, 116)];
    //    self.detailTabelView.tableHeaderView = [[DetailTitleHeaderView alloc]init];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}



@end
