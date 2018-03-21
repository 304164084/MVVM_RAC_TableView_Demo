//
//  BSViewModel.h
//  MVVM_ShoppingCar_Demo
//
//  Created by ZTL_Sui on 2018/3/20.
//  Copyright © 2018年 ZTL_Sui. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXTERN NSString *const BSNavigationTitleKey;

@interface BSViewModel : NSObject
/// navItem.title
@property (nonatomic, readwrite, copy) NSString *title;

/** 服务层 */
@property (nonatomic, readonly, strong) id<NSObject> services;
/** 参数 */
@property (nonatomic, readonly, copy) NSDictionary *paramters;

/** A RACSubject object, which representing all errors occurred in view model. */
@property (nonatomic, readonly, strong) RACSubject *errors;


- (void)initialize;
- (instancetype)initWithServices:(id<NSObject>)services parameters:(NSDictionary *)param;
@end
