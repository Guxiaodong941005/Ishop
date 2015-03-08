//
//  MyGoodsComment.h
//  Ishop
//
//  Created by administrator on 15/3/5.
//  Copyright (c) 2015年 GXD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyGoodsComment : NSObject
@property NSUInteger commentID;
@property NSUInteger userID;
@property NSUInteger goodsID;
@property (copy, nonatomic) NSString * time;
@property (copy, nonatomic) NSString * comment;

+(MyGoodsComment *)commentWithDic:(NSDictionary *)dic;
@end
