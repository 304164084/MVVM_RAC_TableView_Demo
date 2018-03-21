//
//  BSShoppingCarViewController.m
//  MVVM_ShoppingCar_Demo
//
//  Created by ZTL_Sui on 2018/3/20.
//  Copyright © 2018年 ZTL_Sui. All rights reserved.
//

#import "BSGoodsViewController.h"
#import "BSGoodsViewModel.h"
#import "BSGoodsCell.h"

@interface BSGoodsViewController ()<UITableViewDelegate, UITableViewDataSource>
/** data source */
@property (nonatomic, strong) NSArray *dataSource;
/** view model */
@property (nonatomic, strong) BSGoodsViewModel *viewModel;
@end

@implementation BSGoodsViewController
/// 解除警告
///viewModel 声明为readonly,只有getter方法。 setter方法由自己实现
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}
/// override 获取数据
- (instancetype)initWithViewModel:(BSViewModel *)viewModel
{
    if (self = [super initWithViewModel:viewModel]) {
        @weakify(self);
        [[self rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
            @strongify(self);
            /// 执行获取数据的命令
            [self.viewModel.requestRemoteDataCommand execute:@1];
        }];
    }
    return self;
}
- (void)bindViewModel
{
    [super bindViewModel];
    @weakify(self);
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunknown-warning-option"
    [[RACObserve(self.viewModel, dataSource) deliverOnMainThread] subscribeNext:^(id x) {
        @strongify(self);
        [self.tableView reloadData];
    }];
#pragma clang diagnostic pop
}
#pragma mark - lazy tableView
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor orangeColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (void)setupUI
{
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[BSGoodsCell class] forCellReuseIdentifier:@"BSGoodsCellID"];
}

#pragma mark - tableView delegate & datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;//self.viewModel.dataSource ? self.viewModel.dataSource.count : 0
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.dataSource ? self.viewModel.dataSource.count : 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BSGoodsCell *cell = [BSGoodsCell cellWithTableView:tableView];
    [cell bindViewModel:self.viewModel.dataSource[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}


@end
