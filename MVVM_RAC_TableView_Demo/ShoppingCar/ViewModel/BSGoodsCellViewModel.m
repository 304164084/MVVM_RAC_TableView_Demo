//
//  BSGoodsCellViewModel.m
//  MVVM_ShoppingCar_Demo
//
//  Created by ZTL_Sui on 2018/3/20.
//  Copyright © 2018年 ZTL_Sui. All rights reserved.
//

#import "BSGoodsCellViewModel.h"

@interface BSGoodsCellViewModel ()
/** model */
@property (nonatomic, readwrite, strong) BSGoodsModel *goodsModel;
@end

@implementation BSGoodsCellViewModel

- (instancetype)initWithGoodsModel:(BSGoodsModel *)goodsModel
{
    self = [super init];
    if (self) {
        /// 初始化数据及模型数据
        self.goodsModel = goodsModel;
        
    }
    
    return self;
}

@end
