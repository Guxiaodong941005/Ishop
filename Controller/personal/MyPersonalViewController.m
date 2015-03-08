//
//  MyPersonalTableViewController.m
//  Ishop
//
//  Created by admin on 15-3-6.
//  Copyright (c) 2015年 GXD. All rights reserved.
//

#import "MyPersonalViewController.h"
#import "MyLoginViewController.h"
#import "AppDelegate.h"

@interface MyPersonalViewController ()
@property (weak, nonatomic) IBOutlet UIButton *headImageBtn;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *telephone;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UIButton *loginOrQuit;


@property (weak, nonatomic) IBOutlet UILabel *userIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property AppDelegate *appdele;


@end

@implementation MyPersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIApplication * app = [UIApplication sharedApplication];
    self.appdele = app.delegate;
}

-(void)viewWillAppear:(BOOL)animated{
    if (self.appdele.currentUser == nil) {
        [self setDelaultData];
    }else{
        [self setPersonalData];
        self.loginOrQuit.backgroundColor = [UIColor redColor];
        [self.loginOrQuit setTitle:@"退出登录" forState:UIControlStateNormal];
    }
}


#pragma mark-加载用户数据
-(void)setPersonalData{
    [self.headImageBtn setImage:[UIImage imageNamed:self.appdele.currentUser.headerImgName] forState:UIControlStateNormal];
    self.userName.text = self.appdele.currentUser.userName;
    
    self.telephone.text = self.appdele.currentUser.telephone;
    self.email.text = self.appdele.currentUser.email;
    
    
}

//设置默认头像
-(void)setDelaultData{
    //    UIButton * headImageBtn = [[UIButton alloc] initWithFrame:CGRectMake(110.f, 110.f, 100.f, 100.f)];
    
    //
    self.headImageBtn.backgroundColor = [UIColor orangeColor];
    //
    [self.headImageBtn setImage:[UIImage imageNamed:@"icon_headImage"] forState:UIControlStateNormal];
    
    
    
    
    self.headImageBtn.layer.masksToBounds = YES;
    
    self.headImageBtn.layer.cornerRadius = 50;
    
    
    
}


- (IBAction)chageHeadImage:(UIButton *)sender {
    NSLog(@"fghd");
}

//-(void)setPersonData{
////    UIButton * headImageBtn = [[UIButton alloc] initWithFrame:CGRectMake(110.f, 110.f, 100.f, 100.f)];
//    
////    
//   self.headImageBtn.backgroundColor = [UIColor redColor];
////
//    [self.headImageBtn setImage:[UIImage imageNamed:@"icon_headImage"] forState:UIControlStateNormal];
//    
//
//   
//    
//    self.headImageBtn.layer.masksToBounds = YES;
//    
//   self.headImageBtn.layer.cornerRadius = 50;
//
//   
//
//}

- (IBAction)login:(UIButton *)sender {
    if ([self.loginOrQuit.titleLabel.text isEqualToString:@"退出登录"]) {
        [self.loginOrQuit  setTitle:@"登录" forState:UIControlStateNormal];
        self.loginOrQuit.backgroundColor = [UIColor orangeColor];
        self.appdele.currentUser = nil;
        self.userName.text = nil;
        
        self.telephone.text = nil;
        self.email.text = nil;
    }
//    MyLoginViewController * vc = [[MyLoginViewController alloc]init];
//            [vc setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
//            [self presentViewController:vc animated:YES completion:nil];
//    
    
    
}


#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 1;
//}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
