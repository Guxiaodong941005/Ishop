//
//  MyGoodsComment.m
//  Ishop
//
//  Created by administrator on 15/3/5.
//  Copyright (c) 2015年 GXD. All rights reserved.
//

#import "MyGoodsComment.h"

@implementation MyGoodsComment
+(MyGoodsComment *)commentWithDic:(NSDictionary *)dic{
    
    MyGoodsComment *comment = [[MyGoodsComment alloc] init];
    
    comment.commentID = [[dic valueForKey:@"comment_id"] integerValue];
    
    comment.goodsID = [[dic valueForKey:@"goods_id"] integerValue];
    
    comment.userID = [[dic valueForKey:@"user_id"] integerValue];

    comment.comment = [dic valueForKey:@"goods_comment"];
    //用户头像，还有用户名
    
    return comment;
    
}

@end
