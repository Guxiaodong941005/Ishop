//
//  MygoodsCell.h
//  Ishop
//
//  Created by administrator on 15/3/4.
//  Copyright (c) 2015年 GXD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mygoods.h"
@interface MygoodsCell : UITableViewCell
/**
 *  通过一个tableView来创建一个cell
 */

+(instancetype)cellWithTableView:(UITableView *)tableview;
@property (nonatomic , strong) Mygoods *goods;
@end
