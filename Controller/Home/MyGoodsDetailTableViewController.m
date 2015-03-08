//
//  MyGoodsDetailTableViewController.m
//  Ishop
//
//  Created by administrator on 15/3/4.
//  Copyright (c) 2015年 GXD. All rights reserved.
//

#import "MyGoodsDetailTableViewController.h"
#import "AFNetworking.h"
#import "Mygoods.h"
#import "MycommentCell.h"
#import "UIImageView+AFNetworking.h"
#import "MyAddCommentViewController.h"
#import "MycommentTableViewController.h"
#import "MyBuyViewController.h"
#import "MyGoodsComment.h"
#import "MBProgressHUD+MJ.h"
#import "AppDelegate.h"

@interface MyGoodsDetailTableViewController (){
    //当前选中的商品
   __block Mygoods * currentGoods;
    __block NSString * content;
    __block NSString * price;

}

@property (weak, nonatomic) IBOutlet UILabel *nameLable;

@property (weak, nonatomic) IBOutlet UILabel *priceLable;

@property (weak, nonatomic) IBOutlet UILabel *detailLable;

@end

@implementation MyGoodsDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.commentArray = [NSMutableArray array];
    self.title = self.goodsName;
    
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated{
    [self requestGoodByID];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (indexPath.section == 0) {
        return 120;
    }else if (indexPath.section == 1){
    
        return 100;
    
    }else{
    
        return 44;
    }
        
    
   

    
}

#pragma mark -根据ID请求商品详情
-(void)requestGoodByID{
    
    AFHTTPRequestOperationManager * manager = [[AFHTTPRequestOperationManager alloc]init];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSString * urlPath = [NSString stringWithFormat:@"%@detail",kHTTP];
    
 
    NSDictionary * paras = @{@"goods_id":@(self.goodsID)};
   
    
    
    [manager GET:urlPath parameters:paras success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        NSDictionary * responseDic = (NSDictionary *)responseObject;
//        NSLog(@"%@",responseObject);
        
            NSArray * dataArray = [responseDic valueForKey:@"user"];
        
        currentGoods = [Mygoods goodsWithDic:[dataArray objectAtIndex:0]];
        
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, currentScreenWidth - 40, 251)];
        
        NSString *urlPath = [NSString stringWithFormat:@"%@%@",kHTTPImg,currentGoods.icon];
        [imgView setImageWithURL:[NSURL URLWithString:urlPath] placeholderImage:nil];
        
        self.tableView.tableHeaderView = imgView;
        
        self.nameLable.text = currentGoods.title;
       content = currentGoods.title;
        double f = currentGoods.goodsPrice;
        self.priceLable.text = [NSString stringWithFormat:@"￥%.2f",f];
       price = [NSString stringWithFormat:@"￥%.2f",f];
        self.detailLable.text = currentGoods.comment;
    
        
//        [self.tableView reloadData];
       
           } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"fail%@",error);
           }];
}

#pragma mark 页面跳转时传参数
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"comment"]) {
//        MyAddCommentViewController *vc = segue.destinationViewController;
//        
//        vc.goodsID = self.goodsID;
    
    if ([segue.identifier isEqualToString:@"comment2"]){
        MycommentTableViewController * vc = segue.destinationViewController;
        vc.goodsID = self.goodsID;
        
        
    }else if ([segue.identifier isEqualToString:@"buy"]){
        
        MyBuyViewController * vc = segue.destinationViewController;
        vc.content = content;
        vc.price = price;
    }
}
#pragma mark  添加到购物车
- (IBAction)addCartaction:(id)sender {
//    1.1
    AppDelegate * del = [[UIApplication sharedApplication] delegate];
    [del.goodidArray addObject:currentGoods];
    
//    2.1
    [[NSNotificationCenter defaultCenter]postNotificationName:@"NoticeForupdateLoadNumber" object:nil];
    
//    3.1
    [MBProgressHUD showSuccess:@"添加成功，请到购物车查看!"];
    
//    4.1
    [self.navigationController popViewControllerAnimated:YES];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//    // Return the number of sections.
//    return 5;
//}
////
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//
//
//
//    
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
// 
//    MycommentCell * cell = [MycommentCell cellWithTableView:tableView];
//    
//    if (self.commentArray.count == 0) {
//        
//        cell.textLabel.text = @"该商品还没有用户评论！";
//        
//        return cell;
//    }
//    
//    MyGoodsComment *comment = [self.commentArray objectAtIndex:indexPath.row];
//    
//    cell.detailTextLabel.text = comment.comment;
//    NSString *userid = [NSString stringWithFormat:@"%lu",(unsigned long)comment.userID];
//    NSString *goodsid = [NSString stringWithFormat:@"%lu",(unsigned long)comment.goodsID];
//    cell.textLabel.text = [NSString stringWithFormat:@"%@对商品%@的评价",userid,goodsid];
//    return cell;
//}
//

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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation



@end
