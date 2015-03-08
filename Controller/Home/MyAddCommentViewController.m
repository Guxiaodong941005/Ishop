//
//  MyAddCommentViewController.m
//  Ishop
//
//  Created by administrator on 15/3/5.
//  Copyright (c) 2015年 GXD. All rights reserved.
//

#import "MyAddCommentViewController.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+MJ.h"
#import "AppDelegate.h"

@interface MyAddCommentViewController ()<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *commentField;
@property (weak, nonatomic) IBOutlet UILabel *placeHoldlable;
@property AppDelegate * appdele;

@end

@implementation MyAddCommentViewController

- (void)viewDidLoad {
    //1.1获得当前登录的用户ID，添加评论时需
    UIApplication * app = [UIApplication sharedApplication];
    self.appdele = app.delegate;
    
    self.userID = self.appdele.currentUser.userID;
    
    [super viewDidLoad];
    self.commentField.layer.borderColor = UIColor.grayColor.CGColor;
    
    self.commentField.layer.borderWidth = 1;
    
    self.commentField.layer.cornerRadius = 6;
    self.commentField.layer.masksToBounds = YES;
    self.commentField.delegate = self;

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addComment:(UIBarButtonItem *)sender {
    
//    NSLog(@"%lu",(unsigned long)self.goodsID);
//    1.1
    AFHTTPRequestOperationManager *manger = [[AFHTTPRequestOperationManager alloc] init];
//    1.2
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
//    2.1
    NSString *urlPath = [NSString stringWithFormat:@"%@add",kHTTP];
//    NSLog(@"%@",urlPath);
//    3.1
//    @"goodsid":@(self.goodsID)强制转换，字典中不能有INT类型
    NSDate *now = [NSDate date];
    NSLog(@"sbsbsbs%lu",self.goodsID);
    NSDictionary *paras = @{
                            @"goodsid":@(self.goodsID),
//#warning 使用了 userID
                            @"userid":@(self.userID),
                            @"comment":self.commentField.text,
                            @"time":@([now timeIntervalSince1970])
                            };
    //4.1 发送POST请求
    [manger POST:urlPath parameters:paras success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [MBProgressHUD showSuccess:@"添加成功！"];
        
        
//        NSLog(@"%@",responseObject);
        NSLog(@"YES");
        //定义多少时间后可以做什么事情
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController popViewControllerAnimated:YES];
        });
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"add error");
        [MBProgressHUD showError:@"添加失败，请重试"];
        
    }];
    
    
    
}
/**
 *  设置当textField中有文字输入时，就把lable隐藏
 */
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if (![text isEqualToString:@""]) {
        self.placeHoldlable.hidden = YES;
    }
    if ([text isEqualToString:@""] && range.location == 0 && range.length == 1) {
        self.placeHoldlable.hidden = NO;
    }
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    
    return YES;
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
