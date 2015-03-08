//
//  MyhomViewController.m
//  Ishop
//
//  Created by administrator on 15/3/4.
//  Copyright (c) 2015年 GXD. All rights reserved.
//

#import "MyhomViewController.h"
#import "AFNetworking.h"
#import "Mygoods.h"
#import "MygoodsCell.h"
@interface MyhomViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSDictionary *goodsDic;
    AFHTTPRequestOperation *currentOperation;
    NSMutableArray *goodsArray;

}
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation MyhomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    goodsArray = [NSMutableArray array];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    self.tableview.rowHeight = 120;
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [self requestGoodslist];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)requestGoodslist{
    
    //1.接口地址
    NSString *urlPath = @"http://127.0.0.1/zend/iShop/index.php/home/user/goods";
    //2.设置从接口获取的数据类型
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //3.1发送get请求
    [manager GET:urlPath parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        3.2 获取数据，转成模型存到数组
        goodsDic = (NSDictionary *)responseObject;
//        NSLog(@"%@",goodsDic);
        NSString *codestr = [goodsDic valueForKey:@"code"];
        
        if ([codestr isEqualToString:@"200"]) {
            NSArray *dataarray = [goodsDic valueForKey:@"data"];
            for (NSDictionary *dict in dataarray) {
                [goodsArray addObject:[Mygoods goodsWithDic:dict]];
            }
             [self.tableview reloadData];
        }
        
        //4.刷新数据，因为在块里面，所以要重新刷新获取数据
        
       
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"fail  %@",error);
    }];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    if (currentOperation) {
        [currentOperation cancel];
        currentOperation = nil;
    }

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [goodsArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 1.创建cell
    
    MygoodsCell *cell = [MygoodsCell cellWithTableView:tableView];
    cell.tag = [indexPath row];
    // 2.给cell传递模型数据(重写的SET方法)
    cell.goods =goodsArray[indexPath.row];
//    cell.goods = goodsArray[indexPath.row];
    
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSUInteger row = [sender tag];
    Mygoods *g = [goodsArray objectAtIndex:row];
    
    UIViewController *vc = segue.destinationViewController;
    [vc setValue:@(g.goodID) forKey:@"goodsID"];
    [vc setValue:g.title forKey:@"goodsName"];
    //页面跳转时是否隐藏TabBar
    vc.hidesBottomBarWhenPushed = YES;
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
