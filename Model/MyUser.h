//
//  MyUser.h
//  Ishop
//
//  Created by admin on 15-3-5.
//  Copyright (c) 2015年 GXD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyUser : NSObject

@property NSUInteger userID;
@property(copy,nonatomic)NSString * userName;
@property(copy,nonatomic)NSString * password;
@property(copy,nonatomic)NSString * email;
@property NSUInteger registerTime;
@property(copy,nonatomic)NSString * headerImgName;
@property(copy,nonatomic)NSString * telephone;

+(MyUser *)userWithDic:(NSDictionary *)dic;
@end
