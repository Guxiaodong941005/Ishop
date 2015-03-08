//
//  MycommentCell.h
//  Ishop
//
//  Created by administrator on 15/3/5.
//  Copyright (c) 2015年 GXD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyGoodsComment.h"
@interface MycommentCell : UITableViewCell
@property (strong , nonatomic) MyGoodsComment *comment;
+(instancetype)cellWithTableView:(UITableView *)tableview;
@end
