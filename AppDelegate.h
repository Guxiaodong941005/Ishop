//
//  AppDelegate.h
//  Ishop
//
//  Created by administrator on 15/3/4.
//  Copyright (c) 2015年 GXD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyUser.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(strong , nonatomic)NSMutableArray * goodidArray;
@property (strong,nonatomic) MyUser * currentUser;

@end

