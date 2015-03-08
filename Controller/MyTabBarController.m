//
//  MyTabBarController.m
//  Ishop
//
//  Created by administrator on 15/3/4.
//  Copyright (c) 2015年 GXD. All rights reserved.
//

#import "MyTabBarController.h"

@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupItem];
    //设置tabbar的title字体选中时颜色
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} forState:UIControlStateSelected];

    
    
    
    // Do any additional setup after loading the view.
}

-(void)setupItem{
    NSArray *titlesarr = @[@"商品列表",@"购物车",@"个人中心"];
    NSArray *tabbaritemsarr = self.tabBar.items;
    for (int i =0; i < tabbaritemsarr.count; i++) {
        UITabBarItem *item = [tabbaritemsarr objectAtIndex:i];
        item.title = titlesarr[i];
    NSString *img = [NSString stringWithFormat:@"icon_tab%d_normal",i+1];
        NSString *selimg = [NSString stringWithFormat:@"icon_tab%d_selected",i+1];
        
      UIImage * itemimage = [UIImage imageNamed:img];
    UIImage *selitemimg = [UIImage imageNamed:selimg];
//        着色（Tint Color）是iOS7界面中的一个重大改变，你可以设置一个UIImage在渲染时是否使用当前视图的Tint Color。UIImage新增了一个只读属性：renderingMode，对应的还有一个新增方法：imageWithRenderingMode:，它使用UIImageRenderingMode枚举值来设置图片的renderingMode属性。该枚举中包含下列值：
        //默认选中是蓝色，要是项用自己的图片则要用下面这个方法，让自动上色取消
        
        
        item.image = [itemimage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.image = itemimage;
        item.selectedImage = selitemimg;
        item.selectedImage = [selitemimg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
       
        
    }

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
