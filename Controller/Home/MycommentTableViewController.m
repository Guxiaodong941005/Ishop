//
//  MycommentTableViewController.m
//  Ishop
//
//  Created by administrator on 15/3/5.
//  Copyright (c) 2015年 GXD. All rights reserved.
//

#import "MycommentTableViewController.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "MyGoodsComment.h"
#import "MycommentCell.h"
#import "MyAddCommentViewController.h"
#import "AppDelegate.h"

@interface MycommentTableViewController (){
    NSMutableArray * commentArray;

}
@property AppDelegate * appdele;

@end

@implementation MycommentTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIApplication * app = [UIApplication sharedApplication];
    self.appdele = app.delegate;
    
    
    NSLog(@"%lu",(unsigned long)self.goodsID);
    commentArray = [NSMutableArray array];
    [self requestCommentByID];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated{
    [self requestCommentByID];
}

-(void)requestCommentByID{
    
    AFHTTPRequestOperationManager * manager = [[AFHTTPRequestOperationManager alloc]init];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSString * urlPath = [NSString stringWithFormat:@"%@comment?goodsid=%lu",kHTTP,(unsigned long)self.goodsID];
    
    
   
    NSLog(@"%lu",(unsigned long)self.goodsID);
    
    
    
    [manager GET:urlPath parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        3.2 获取数据，转成模型存到数组
        NSDictionary * goodsDic = (NSDictionary *)responseObject;
        //        NSLog(@"%@",goodsDic);
        NSString *codestr = [goodsDic valueForKey:@"code"];
        
        if ([codestr isEqualToString:@"200"]) {
            NSArray *dataarray = [goodsDic valueForKey:@"data"];
            for (NSDictionary *dict in dataarray) {
                [commentArray addObject:[MyGoodsComment commentWithDic:dict]];
            }
            [self.tableView reloadData];
            NSLog(@"%@",[[commentArray objectAtIndex:0] comment]);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@fail",error);
    }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return commentArray.count;
}

//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * ID = @"commentcell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    MyGoodsComment *comment = [commentArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = comment.comment;
    
    NSString * userid = [NSString stringWithFormat:@"%lu",comment.userID];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"用户%@的评论",userid];
    
    return cell;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

        if ([segue.identifier isEqualToString:@"addcomment"]) {
            MyAddCommentViewController *vc = segue.destinationViewController;
            
            vc.goodsID = self.goodsID;
        }
}
-(void)viewDidAppear:(BOOL)animated{
    [commentArray removeAllObjects];

    [self requestCommentByID];
    
    NSLog(@"MycommentTableViewController出现");
   

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
