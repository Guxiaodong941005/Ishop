//
//  MyLoginViewController.m
//  Ishop
//
//  Created by admin on 15-3-5.
//  Copyright (c) 2015年 GXD. All rights reserved.
//

#import "MyLoginViewController.h"
#import "MyCreateNewUserViewController.h"
#import "MyhomViewController.h"
#import "MyMainViewController.h"
#import "MyPersonalViewController.h"
#import "AFNetworking.h"
#import "MBProgressHUD+MJ.h"
#import "AppDelegate.h"

@interface MyLoginViewController ()

@property(strong,nonatomic)NSString * userName;
@property(strong,nonatomic)NSString * password;

@property (weak, nonatomic) IBOutlet UITextField *MyUserName;
@property (weak, nonatomic) IBOutlet UITextField *MyPassword;
@property AppDelegate *appdele;

- (IBAction)login;






@end

@implementation MyLoginViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIApplication * app = [UIApplication sharedApplication];
    self.appdele = app.delegate;
}

-(void)getUser{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSString *urlPath = [NSString stringWithFormat:@"%@login",kHTTP];
    
    NSDictionary * paras = @{@"username":self.MyUserName.text,@"password":self.MyPassword.text};
   
    [manager POST:urlPath parameters:paras success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary * responseDic = (NSDictionary *)responseObject;
        NSArray * dataArray = [responseDic valueForKey:@"user"];
        NSLog(@"%@",dataArray);
        user = [MyUser userWithDic:[dataArray objectAtIndex:0]];
        NSLog(@"%@",user.userName);
        NSLog(@"%@",user.userName);
        NSLog(@"%@",user.password);
        if ([user.userName isEqualToString:self.MyUserName.text]&&[user.password isEqualToString:self.MyPassword.text]) {
            UILabel * lable = [[UILabel alloc]init];
            lable.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, 50, 25);
            lable.text = @"机智的骚年！！";
            [self.view addSubview:lable];
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setValue:@"1" forKey:@"isLogin"];
            [defaults setValue:self.userName forKey:@"username"];
            [defaults setValue:self.password forKey:@"password"];
            
            //写入磁盘
            [defaults synchronize];
//            NSLog(@"yes");
            self.appdele.currentUser = user;
            NSLog(@"wenhui%lu",[self.appdele.currentUser userID]);
            [self.navigationController popToRootViewControllerAnimated:YES];
//            MyMainViewController *vc = [[MyMainViewController alloc]init];
//            [self presentViewController:vc animated:YES completion:nil];
        }else{
            NSLog(@"你特么连自己账号跟密码都记不住？");
        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        UILabel * lable = [[UILabel alloc]init];
        lable.frame = CGRectMake(200, 400, 100, 25);
        lable.text = @"网都没连你还想玩？";
        [self.view addSubview:lable];
    }];
    
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

- (IBAction)login {
    
    
    
    [self getUser];
    NSLog(@"已经登录");
    
//    if ([user.userName isEqualToString:self.MyUserName.text]&&[user.password isEqualToString:self.MyPassword.text]) {
//        UILabel * lable = [[UILabel alloc]init];
//        lable.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, 50, 25);
//        lable.text = @"机智的骚年！！";
//        [self.view addSubview:lable];
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        [defaults setValue:self.userName forKey:self.password];
//       
//        //写入磁盘
//        [defaults synchronize];
//        MyMainViewController *vc = [[MyMainViewController alloc]init];
//        [self presentViewController:vc animated:YES completion:nil];
//    }else{
//        NSLog(@"你特么连自己账号跟密码都记不住？真蠢！！");
//    }
//    
}











@end
