//
//  BSGoodsCell.h
//  MVVM_ShoppingCar_Demo
//
//  Created by ZTL_Sui on 2018/3/20.
//  Copyright © 2018年 ZTL_Sui. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BSGoodsCellViewModel;

@interface BSGoodsCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

- (void)bindViewModel:(BSGoodsCellViewModel *)viewModel;
@end
