//
//  BSGoodsCell.m
//  MVVM_ShoppingCar_Demo
//
//  Created by ZTL_Sui on 2018/3/20.
//  Copyright © 2018年 ZTL_Sui. All rights reserved.
//

#import "BSGoodsCell.h"
#import "BSGoodsCellViewModel.h"

@interface BSGoodsCell ()

/** view model */
@property (nonatomic, readwrite, strong) BSGoodsCellViewModel *viewModel;
@end

@implementation BSGoodsCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *reuseID = @"BSGoodsCellID";
    BSGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[BSGoodsCell alloc] init];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //custom code ...
        [self makeUI];
    }
    
    return self;
}

/// set up UI
- (void)makeUI
{
    
}

- (void)bindViewModel:(BSGoodsCellViewModel *)viewModel
{
    self.viewModel = viewModel;
    self.textLabel.text =[NSString stringWithFormat:@"%@", viewModel.goodsModel.thumb_url];
}
@end
