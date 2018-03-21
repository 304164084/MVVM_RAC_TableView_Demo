//
//  BSTableViewModel.m
//  MVVM_ShoppingCar_Demo
//
//  Created by ZTL_Sui on 2018/3/21.
//  Copyright © 2018年 ZTL_Sui. All rights reserved.
//

#import "BSTableViewModel.h"

@interface BSTableViewModel ()
/** 获取服务器数据的命令 */
@property (nonatomic, readwrite, strong) RACCommand *requestRemoteDataCommand;
@end

@implementation BSTableViewModel

- (void)initialize
{
    [super initialize];
    self.page = 0;
    self.pageSize = 20;
    @weakify(self);
    /// 获取数据
    self.requestRemoteDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(NSNumber *page) {
        @strongify(self);
        return [[self requestRemoteDataSignalWithPage:page.unsignedIntegerValue] takeUntil:self.rac_willDeallocSignal];
    }];
    
    /// 过滤错误信息
    [[self.requestRemoteDataCommand.errors filter:[self requestRemoteDataErrorFilter]] subscribe:self.errors];
}
/// sub class can override the following method
- (BOOL (^)(NSError *error))requestRemoteDataErrorFilter
{
    return ^(NSError *error) {
        return YES;
    };
}
- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page
{
    return [RACSignal empty];
}

@end
