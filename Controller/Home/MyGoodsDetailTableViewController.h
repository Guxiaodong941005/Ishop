//
//  MyGoodsDetailTableViewController.h
//  Ishop
//
//  Created by administrator on 15/3/4.
//  Copyright (c) 2015年 GXD. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface MyGoodsDetailTableViewController : UITableViewController
@property NSUInteger goodsID;
@property(copy,nonatomic)NSString *goodsName;
@property(strong , nonatomic)NSMutableArray *commentArray;

@end
