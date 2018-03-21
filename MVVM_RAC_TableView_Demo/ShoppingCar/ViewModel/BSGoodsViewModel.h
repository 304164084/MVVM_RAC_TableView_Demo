//
//  BSShoppingCarViewModel.h
//  MVVM_ShoppingCar_Demo
//
//  Created by ZTL_Sui on 2018/3/20.
//  Copyright © 2018年 ZTL_Sui. All rights reserved.
//

#import "BSTableViewModel.h"
#import "BSGoodsCellViewModel.h"

@interface BSGoodsViewModel : BSTableViewModel

/** data source */
@property (nonatomic, readonly, strong) NSArray *goods;

@end
