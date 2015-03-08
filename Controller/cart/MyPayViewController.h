//
//  MyPayViewController.h
//  Ishop
//
//  Created by administrator on 15/3/7.
//  Copyright (c) 2015年 GXD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mygoods.h"
@interface MyPayViewController : UIViewController
@property Mygoods * tempgoods;
@property NSUInteger indexRow;
@property double  money;
@property (copy, nonatomic) NSString * content;
@end
