//
//  BSViewController.h
//  MVVM_ShoppingCar_Demo
//
//  Created by ZTL_Sui on 2018/3/20.
//  Copyright © 2018年 ZTL_Sui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BSViewModel.h"

@interface BSViewController : UIViewController
/** view model */
@property (nonatomic, readonly, strong) BSViewModel *viewModel;

/// can override
- (instancetype)initWithViewModel:(BSViewModel *)viewModel;


/// 绑定数据模型
- (void)bindViewModel;

@end
