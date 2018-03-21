//
//  BSTableViewModel.h
//  MVVM_ShoppingCar_Demo
//
//  Created by ZTL_Sui on 2018/3/21.
//  Copyright © 2018年 ZTL_Sui. All rights reserved.
//

#import "BSViewModel.h"

@interface BSTableViewModel : BSViewModel
/** data source */
@property (nonatomic, strong) NSArray *dataSource;
/** 当前页 default is 0 */
@property (nonatomic, assign) NSUInteger page;
/** 每一页数据 default is 20 */
@property (nonatomic, assign) NSUInteger pageSize;
/** 获取服务器数据的命令 */
@property (nonatomic, readonly, strong) RACCommand *requestRemoteDataCommand;

///获取数据 sub class override it
- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page;
@end
