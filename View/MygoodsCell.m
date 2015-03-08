//
//  MygoodsCell.m
//  Ishop
//
//  Created by administrator on 15/3/4.
//  Copyright (c) 2015年 GXD. All rights reserved.
//

#import "MygoodsCell.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
@interface MygoodsCell()


@property (weak, nonatomic) IBOutlet UIImageView *iconview;


@property (weak, nonatomic) IBOutlet UILabel *titleview;
@property (weak, nonatomic) IBOutlet UILabel *priceview;

@end
@implementation MygoodsCell
+(instancetype)cellWithTableView:(UITableView *)tableview{
static NSString *ID = @"goods";
    MygoodsCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
//    if (cell == nil) {
//        cell = [[[NSBundle mainBundle] loadNibNamed:@"MygoodsCell" owner:nil options:nil] lastObject];
//        
//    }
    return cell;

}
- (void)awakeFromNib {
    
    self.iconview.layer.cornerRadius = 15;
    self.iconview.layer.masksToBounds = YES;
    
   
}

-(void)setGoods:(Mygoods *)goods{
    _goods = goods;
    self.titleview.text = goods.title;
     self.iconview.image = nil;
    NSString *urlPath = [NSString stringWithFormat:@"%@%@",kHTTPImg,goods.icon];
    [self.iconview setImageWithURL:[NSURL URLWithString:urlPath] placeholderImage:[UIImage imageNamed:@"1.jpg"]];
    self.priceview.text = [NSString stringWithFormat:@"%.2lf",goods.goodsPrice];

    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
