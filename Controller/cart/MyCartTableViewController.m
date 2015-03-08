//
//  MyCartTableViewController.m
//  Ishop
//
//  Created by administrator on 15/3/7.
//  Copyright (c) 2015年 GXD. All rights reserved.
//

#import "MyCartTableViewController.h"
#import "AppDelegate.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "Mygoods.h"
#import "MyPayViewController.h"
@interface MyCartTableViewController (){
    NSMutableArray * goodsArray;

}

@end

@implementation MyCartTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self requestGoodByGoodsID];
//    1.1
    AppDelegate * del = [[UIApplication sharedApplication] delegate];
    
    goodsArray = [NSMutableArray array];
    
    goodsArray = del.goodidArray;
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)requestGoodByGoodsID{
    
    //1.1
    
    
    
    
//    AFHTTPRequestOperationManager * manager = [[AFHTTPRequestOperationManager alloc]init];
    
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    
//    NSString * urlPath = [NSString stringWithFormat:@"%@detail",kHTTP];
//    
//    NSUInteger * goodsID = [goodsArray objectAtIndex:<#(NSUInteger)#>]
//    
//    
//    NSDictionary * paras = @{@"goods_id":@(goodsID)};
    
    
    
//    [manager GET:urlPath parameters:paras success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        
//        NSDictionary * responseDic = (NSDictionary *)responseObject;
//        //        NSLog(@"%@",responseObject);
//        
//        NSArray * dataArray = [responseDic valueForKey:@"user"];
//        
//        currentGoods = [Mygoods goodsWithDic:[dataArray objectAtIndex:0]];
    




}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return goodsArray.count;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self.tableView reloadData];

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
   
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.tag = indexPath.row;
        
  
    cell.textLabel.text = [[goodsArray objectAtIndex:indexPath.row] comment];
    
    
    
    return cell;
}


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


#pragma mark - 页面跳转

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSUInteger  index = [sender tag];
    
    
    
    MyPayViewController * vc = [segue destinationViewController];
    
    Mygoods * goods = [[Mygoods alloc]init];
    goods = [goodsArray objectAtIndex:index];
    
    vc.tempgoods = goods;
    
    vc.money = [goods goodsPrice];
    
    vc.content = [goods comment];
    
    vc.indexRow = index;
    
    
    }

@end
