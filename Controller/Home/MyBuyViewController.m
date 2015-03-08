//
//  MyBuyViewController.m
//  Ishop
//
//  Created by administrator on 15/3/6.
//  Copyright (c) 2015年 GXD. All rights reserved.
//

#import "MyBuyViewController.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+MJ.h"
#import "MyGoodsDetailTableViewController.h"
@interface MyBuyViewController ()
@property (weak, nonatomic) IBOutlet UILabel *cntentLable;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;

@end

@implementation MyBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cntentLable.text = self.content;
    self.priceLable.text = self.price;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)moneyAction:(id)sender {
  
    [MBProgressHUD showSuccess:@"购买成功"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.navigationController popViewControllerAnimated:YES];
    });
    
    
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
