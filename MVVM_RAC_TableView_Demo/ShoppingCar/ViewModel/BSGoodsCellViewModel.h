//
//  BSGoodsCellViewModel.h
//  MVVM_ShoppingCar_Demo
//
//  Created by ZTL_Sui on 2018/3/20.
//  Copyright © 2018年 ZTL_Sui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSGoodsModel.h"

@interface BSGoodsCellViewModel : NSObject
/** model */
@property (nonatomic, readonly, strong) BSGoodsModel *goodsModel;

- (instancetype)initWithGoodsModel:(BSGoodsModel *)goodsModel;
@end
