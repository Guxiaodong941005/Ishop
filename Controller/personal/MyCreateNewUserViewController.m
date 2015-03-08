//
//  MyCreateNewUserViewController.m
//  Ishop
//
//  Created by admin on 15-3-5.
//  Copyright (c) 2015年 GXD. All rights reserved.
//

#import "MyCreateNewUserViewController.h"
#import "MyLoginViewController.h"
#import "MyLoginViewController.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+MJ.h"

@interface MyCreateNewUserViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *passwordAgain;
@property (weak, nonatomic) IBOutlet UITextField *telephone;
@property (weak, nonatomic) IBOutlet UITextField *email;

- (IBAction)completeRegister;

@end

@implementation MyCreateNewUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -注册代码未完成
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    [self.view endEditing:YES];

}

- (IBAction)completeRegister {
    
    NSLog(@"wancheng");
    AFHTTPRequestOperationManager *manger = [[AFHTTPRequestOperationManager alloc] init];
    //    1.2
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    //    2.1
    NSString *urlPath = [NSString stringWithFormat:@"%@register",kHTTP];
    NSLog(@"%@",urlPath);
    //    3.1
    //    @"goodsid":@(self.goodsID)强制转换，字典中不能有INT类型
    NSDate *now = [NSDate date];
    
//   
    NSDictionary *paras = @{
                            @"tel":self.telephone.text,
                           @"username":self.userName.text,
                            @"userpassword":self.password.text,
                            @"useremail":self.email.text,
                           
                            @"userregistertime":@([now timeIntervalSince1970])
                            };
    //4.1 发送POST请求
    [manger POST:urlPath parameters:paras success:^(AFHTTPRequestOperation *operation, id responseObject) {
      [MBProgressHUD showSuccess:@"注册成功！"];
        
         [self.navigationController popViewControllerAnimated:YES];
        
        

        NSLog(@"YES---");
        //定义多少时间后可以做什么事情
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [self.navigationController popViewControllerAnimated:YES];
//        });
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"add error");
        [MBProgressHUD showError:@"注册失败，请重试"];
        
    }];

    
    
}
@end
