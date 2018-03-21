//
//  BSViewController.m
//  MVVM_ShoppingCar_Demo
//
//  Created by ZTL_Sui on 2018/3/20.
//  Copyright © 2018年 ZTL_Sui. All rights reserved.
//

#import "BSViewController.h"
#import "BSNavigationController.h"

@interface BSViewController ()

/** view model read write */
@property (nonatomic, readwrite, strong) BSViewModel *viewModel;

@end

@implementation BSViewController

#pragma mark - dealloc
- (void)dealloc
{
    NSLog(@"🔥控制器销毁了！~~🔥🔥🔥");
}
#pragma mark - alloc & init
/// 初始化时，并且调用viewDidLoad方法时，自动绑定数据
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    BSViewController *viewController = [super allocWithZone:zone];
    
    @weakify(viewController);
    [[viewController
      rac_signalForSelector:@selector(viewDidLoad)]
     subscribeNext:^(id x) {
         @strongify(viewController)
         [viewController bindViewModel];
     }];
    
    return viewController;
}

- (instancetype)initWithViewModel:(BSViewModel *)viewModel
{
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
    }
    
    return self;
}
#pragma mark - Life Cycle
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    /// 隐藏导航栏细线
    ///配置键盘
    /// 做友盟统计
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (@available(iOS 11.0, *)) {
        self.automaticallyAdjustsScrollViewInsets = YES;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    
}

#pragma mark - custom method
- (void)bindViewModel
{
//    @weakify(self);

#pragma clang diagnostic ignored "-Wunknown-warning-option"
    RAC(self.navigationItem , title) = RACObserve(self, viewModel.title);
#pragma clang diagnostic pop
    /// 绑定错误信息， 用于统一处理错误
}



@end
