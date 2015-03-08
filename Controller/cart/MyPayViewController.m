//
//  MyPayViewController.m
//  Ishop
//
//  Created by administrator on 15/3/7.
//  Copyright (c) 2015年 GXD. All rights reserved.
//

#import "MyPayViewController.h"
#import "MBProgressHUD+MJ.h"
#import "AppDelegate.h"
@interface MyPayViewController ()
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;

@end

@implementation MyPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.moneyLabel.text = [NSString stringWithFormat:@"价格:%.2lf,请立即支付",self.money];
    // Do any additional setup after loading the view.
}

- (IBAction)payAction:(UIButton *)sender {
    
    [MBProgressHUD showSuccess:@"支付成功，正在跳转支付宝"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        
        [self.navigationController popViewControllerAnimated:YES];
        AppDelegate * del = [[UIApplication sharedApplication] delegate];
        
        [del.goodidArray removeObject:self.tempgoods];
        
//        [del.goodidArray removeObjectAtIndex:0];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"NoticeForupdateLoadNumber" object:nil];
        
        
        NSString * str = [NSString stringWithFormat:@"您的支付宝成功支付:%.2lf元",self.money];
        [MBProgressHUD showSuccess:str];
        
    });
    
    
    
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
