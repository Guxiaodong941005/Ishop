//
//  MyMainViewController.m
//  Ishop
//
//  Created by admin on 15-3-5.
//  Copyright (c) 2015年 GXD. All rights reserved.
//

#import "MyMainViewController.h"
#import "AppDelegate.h"
@interface MyMainViewController ()

@end

@implementation MyMainViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    1.1创建通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updataLoadNumber:) name:@"NoticeForupdateLoadNumber" object:nil];
    
//    NoticeForupdateLoadNumberAgain
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updataLoadNumberAgian:) name:@"NoticeForupdateLoadNumberAgian" object:nil];
    
    // Do any additional setup after loading the view.
    //设置选中时的字体颜色
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    //模式tabBar图标选中时的描边颜色
//    [self.tabBar setTintColor:[UIColor orangeColor]];
    //向tabBar中添加第一个页面
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController * mainVC = [mainStoryBoard instantiateInitialViewController];
    [self addViewController:mainVC andTitle:@"商品列表" andImage:@"icon_tab1_normal" andSelectedImage:@"icon_tab1_selected"];
    
    
    //第二个页面
    UIViewController *cartVC = [[UIStoryboard storyboardWithName:@"Cart" bundle:nil] instantiateInitialViewController];
    
    [self addViewController:cartVC andTitle:@"购物车" andImage:@"icon_tab2_normal" andSelectedImage:@"icon_tab2_selected"];
    
   

    //第三个页面
    UIViewController *personalVC = [[UIStoryboard storyboardWithName:@"Personal" bundle:nil] instantiateInitialViewController];
    
    [self addViewController:personalVC andTitle:@"个人中心" andImage:@"icon_tab3_normal" andSelectedImage:@"icon_tab2_selected"];
    self.selectedIndex = 0;
    
}
//-(void)updataLoadNumberAgian:(NSNotificationCenter *)notification{
//
//    NSArray *tabItems = self.tabBar.items;
//    UITabBarItem * second = [tabItems objectAtIndex:1];
//    
//    AppDelegate *del = [[UIApplication sharedApplication] delegate];
//    second.badgeValue = [NSString stringWithFormat:@"%lu",(unsigned long)[del.goodidArray count]];


//}
-(void)updataLoadNumber:(NSNotification *)notification{
    NSArray *tabItems = self.tabBar.items;
    UITabBarItem * second = [tabItems objectAtIndex:1];
    
    AppDelegate *del = [[UIApplication sharedApplication] delegate];
    

    
    if (del.goodidArray.count == 0) {
        second.badgeValue = nil;
        
    }else{
    second.badgeValue = [NSString stringWithFormat:@"%lu",(unsigned long)[del.goodidArray count]];
    }

}

//设置控制器属性
-(void)addViewController:(UIViewController *)vc andTitle:(NSString *)title andImage:(NSString *)imageName andSelectedImage:(NSString *)selectedImageName{
    vc.tabBarItem.title = title;
    
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.image = [vc.tabBarItem.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    vc.tabBarItem.selectedImage = [vc.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:vc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
