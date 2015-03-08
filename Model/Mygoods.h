//
//  Mygoods.h
//  Ishop
//
//  Created by administrator on 15/3/4.
//  Copyright (c) 2015年 GXD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mygoods : NSObject
@property NSUInteger goodID;
@property NSUInteger goodsTypeID;
@property (copy, nonatomic) NSString * title;
@property (copy, nonatomic) NSString * comment;
@property (copy, nonatomic) NSString * icon;
@property double goodsPrice;

+(Mygoods *)goodsWithDic:(NSDictionary *)dic;

@end
