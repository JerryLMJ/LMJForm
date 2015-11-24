//
//  LMJFormCell.m
//  LMJForm
//
//  Version:1.0.0
//
//  Created by MajorLi on 14-12-3.
//  Copyright (c) 2014年 杰睿科技. All rights reserved.
//

#import "LMJFormCell.h"

@implementation LMJFormCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    }
    return self;
}

-(void)setCellColumnsWithColumnWidesArray:(NSArray *)allColumnWidesArr  lineHeight:(CGFloat)LHeight{

    
    CGFloat columnX = 0.0;
    
    for (NSNumber * number in allColumnWidesArr){
        
        CGFloat columnWide = [number floatValue];
        
        UIView * subView = [[UIView alloc] initWithFrame:CGRectMake(columnX, 0, columnWide, LHeight)];
        subView.backgroundColor = [UIColor whiteColor];
        subView.layer.borderColor = [UIColor grayColor].CGColor;
        subView.layer.borderWidth = 1.0;
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, columnWide, LHeight)];
        [label setNumberOfLines:0];
        label.text = @"12";//填充数据
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14];
        [subView addSubview:label];
        
        [self.contentView addSubview:subView];
        
        columnX += columnWide;
    }
}


- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
