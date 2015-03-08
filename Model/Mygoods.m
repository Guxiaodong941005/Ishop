//
//  Mygoods.m
//  Ishop
//
//  Created by administrator on 15/3/4.
//  Copyright (c) 2015年 GXD. All rights reserved.
//

#import "Mygoods.h"

@implementation Mygoods
+(Mygoods *)goodsWithDic:(NSDictionary *)dic{
    Mygoods *goods = [[Mygoods alloc] init];
    goods.goodID = [[dic valueForKey:@"goods_id"] integerValue];
    goods.goodsTypeID = [[dic valueForKey:@"goods_typeid"] integerValue];
    goods.title = [dic valueForKey:@"goods_name"];
    goods.icon = [dic valueForKey:@"goods_headerimage"];
    goods.comment = [dic valueForKey:@"goods_comment"];
    
    goods.goodsPrice = [[dic valueForKey:@"goods_price"] doubleValue];
    
    
    
    return goods;

}
@end
