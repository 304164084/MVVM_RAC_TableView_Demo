//
//  BSShoppingCarViewModel.m
//  MVVM_ShoppingCar_Demo
//
//  Created by ZTL_Sui on 2018/3/20.
//  Copyright © 2018年 ZTL_Sui. All rights reserved.
//

#import "BSGoodsViewModel.h"
#import "BSGoodsModel.h"

@interface BSGoodsViewModel ()
/** data source */
@property (nonatomic, readwrite, strong) NSArray *goods;
@end

@implementation BSGoodsViewModel

- (void)initialize
{
    [super initialize];
    self.title = @"模仿demo";

    @weakify(self);
    /// 获取数据
    RAC(self, goods) = self.requestRemoteDataCommand.executionSignals.switchToLatest;
    
    /// 数据源
    RAC(self, dataSource) = [RACObserve(self, goods) map:^id(NSArray *goods) {
        @strongify(self);
        return [self dataSourceWithGoods:goods];
    }];
    
}
/// override
- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page
{
    return [self getLocalData];
}
/// 获取本地数据
- (RACSignal *)getLocalData
{
    /// 随机延迟时间
    CGFloat time = arc4random()%15 / 10.0;
    
    /// 获取数据
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"CategoryAllGoods" ofType:nil]];
    /// 数据数组转换为模型数组
    array = [BSGoodsModel mj_objectArrayWithKeyValuesArray:array];
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:array];
        [subscriber sendCompleted];
        return nil;
    }] delay:time];
}

#pragma mark - 辅助
// 是否为空对象
#define BSObjectIsNil(__object)  ((nil == __object) || [__object isKindOfClass:[NSNull class]])
- (NSArray *)dataSourceWithGoods:(NSArray *)goods
{
    if (BSObjectIsNil(goods) || goods.count ==0) return nil;
    
    NSArray *viewModels = [goods.rac_sequence map:^id(BSGoodsModel *itemModel) {
        BSGoodsCellViewModel *viewModel = [[BSGoodsCellViewModel alloc] initWithGoodsModel:itemModel];
        return viewModel;
    }].array;
    return viewModels ? : @[];
}

@end
