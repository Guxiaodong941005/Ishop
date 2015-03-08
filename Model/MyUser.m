//
//  MyUser.m
//  Ishop
//
//  Created by admin on 15-3-5.
//  Copyright (c) 2015年 GXD. All rights reserved.
//

#import "MyUser.h"

@implementation MyUser

+(MyUser *)userWithDic:(NSDictionary *)dic{
    MyUser * user = [[MyUser alloc]init];
    user.userID = [[dic valueForKey:@"user_id"] integerValue];
    user.userName = [dic valueForKey:@"user_name"];
    user.password = [dic valueForKey:@"user_password"];
    user.email = [dic valueForKey:@"user_email"];
    user.registerTime = [[dic valueForKey:@"user_registerTime"]integerValue];
    user.headerImgName  = [dic valueForKey:@"user_headerImage"];
    user.telephone = [dic valueForKey:@"user_telephone"];
    return user;
}

@end
