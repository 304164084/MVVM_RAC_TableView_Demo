//
//  BSViewModel.m
//  MVVM_ShoppingCar_Demo
//
//  Created by ZTL_Sui on 2018/3/20.
//  Copyright © 2018年 ZTL_Sui. All rights reserved.
//

#import "BSViewModel.h"

NSString *const BSNavigationTitleKey = @"BSNavigationTitleKey";

@interface BSViewModel ()

/** 服务层 */
@property (nonatomic, strong) id<NSObject> services;
/** 参数 */
@property (nonatomic, copy) NSDictionary *paramters;

@property (nonatomic, readwrite, strong) RACSubject *errors;

@end

@implementation BSViewModel


+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    BSViewModel *viewModel = [super allocWithZone:zone];
    @weakify(viewModel);
    [[viewModel rac_signalForSelector:@selector(initWithServices:parameters:)] subscribeNext:^(id x) {
        @strongify(viewModel);
        [viewModel initialize];
    }];
    
    return viewModel;
}
/// 实例化
- (instancetype)initWithServices:(id<NSObject>)services parameters:(NSDictionary *)param
{
    self = [super init];
    if (self) {
        self.title = param[BSNavigationTitleKey];
        self.services = services;
        self.paramters = param;
    }
    return self;
}
/// this method can overrid by sub class
- (void)initialize
{
    // in sub class, you can insert some about initiliaze code here
}
/// getter
- (RACSubject *)errors
{
    if (!_errors) {
        _errors = [RACSubject subject];
    }
    return _errors;
}
@end
