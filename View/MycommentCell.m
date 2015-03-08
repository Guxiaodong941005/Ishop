//
//  MycommentCell.m
//  Ishop
//
//  Created by administrator on 15/3/5.
//  Copyright (c) 2015年 GXD. All rights reserved.
//

#import "MycommentCell.h"

@interface MycommentCell(){



    
}
@property (weak, nonatomic) IBOutlet UILabel *detail;

@property (weak, nonatomic) IBOutlet UILabel *xiangqing;


@end

@implementation MycommentCell

+(instancetype)cellWithTableView:(UITableView *)tableview{
static NSString *ID = @"comment";

    MycommentCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    
    return cell;
    
}



- (void)awakeFromNib {
    // Initialization code
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
