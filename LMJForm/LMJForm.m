//
//  LMJForm.m
//  LMJForm
//
//  Version:1.0.0
//
//  Created by MajorLi on 14-12-3.
//  Copyright (c) 2014年 iOS开发者公会. All rights reserved.
//
//  iOS开发者公会-技术1群 QQ群号：87440292
//  iOS开发者公会-技术2群 QQ群号：232702419
//  iOS开发者公会-议事区  QQ群号：413102158
//

#import "LMJForm.h"
#import "LMJFormCell.h"
#import "LMJFormColumn.h"


#define SerialNumberColumnWide 40.0

@implementation LMJForm
{
    CGFloat _headerLineHeight;
    CGFloat _lineHeight;
    NSArray * _formColumnsArr;
    
    
    
    CGFloat _allColumnsWide;
    NSMutableArray * _allColumnWidesArr;
    
    
    
    UIScrollView * _scrollView;
    
    UITableView * _contentTableView;
    UITableView * _serialNumberTableView;
    
    UIView * _contentTableHeadView;
    UIView * _serialNumberTableHeadView;
}

-(id)init{
    NSAssert(NO, @"禁止使用init函数进行控件的初始化，请使用initWithFrame:headerLineHeight:lineHeight:formColumns:函数进行控件初始化");
    return nil;
}
-(id)initWithFrame:(CGRect)frame{
    NSAssert(NO, @"禁止使用initWithFrame:函数进行控件的初始化，请使用initWithFrame:headerLineHeight:lineHeight:formColumns:函数进行控件初始化");
    return nil;
}


-(id)initWithFrame:(CGRect)frame headerLineHeight:(CGFloat)HLHeight lineHeight:(CGFloat)LHeight formColumns:(NSArray *)formColumns{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = [UIColor blackColor].CGColor;
        
        _headerLineHeight = HLHeight;
        _lineHeight = LHeight;
        _formColumnsArr = [formColumns copy];
        
        [self createForm];
    }
    return self;
}

-(void)createForm{
    [self creatHeadView];
    [self creatContentView];
    [self crestSerialNumberView];
}

-(void)creatHeadView{
    _contentTableHeadView = [[UIView alloc] init];
    
    _allColumnWidesArr = [[NSMutableArray alloc] init];
    
    CGFloat x_column = 0.0;
    
    for (LMJFormColumn * column in _formColumnsArr) {
        
        UIView * subView = [[UIView alloc] initWithFrame:CGRectMake(x_column, 0, column.wide, _headerLineHeight)];
        subView.backgroundColor = [UIColor lightGrayColor];
        subView.layer.borderColor = [UIColor blackColor].CGColor;
        subView.layer.borderWidth = 1.0;
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, column.wide, _headerLineHeight)];
        [label setNumberOfLines:0];
        label.text = column.title;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14];
        [subView addSubview:label];
        
        [_contentTableHeadView addSubview:subView];
        
        x_column += column.wide;
        [_allColumnWidesArr addObject:[NSNumber numberWithFloat:column.wide]];
    }
    _allColumnsWide = x_column;
    
    
    _serialNumberTableHeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SerialNumberColumnWide, _headerLineHeight)];
    _serialNumberTableHeadView.layer.borderColor = [UIColor blackColor].CGColor;
    _serialNumberTableHeadView.layer.borderWidth = 1.0;
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SerialNumberColumnWide, _headerLineHeight)];
    label.text = @"序号";
    label.backgroundColor = [UIColor lightGrayColor];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentCenter;
    [_serialNumberTableHeadView addSubview:label];
}

-(void)creatContentView{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(SerialNumberColumnWide, 0, self.frame.size.width - SerialNumberColumnWide, self.frame.size.height)];
    _scrollView.contentSize = CGSizeMake(_allColumnsWide, _scrollView.frame.size.height);
    _scrollView.bounces = NO;
    [self addSubview:_scrollView];
    
    
    _contentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, _allColumnsWide, _scrollView.frame.size.height)];
    _contentTableView.delegate = self;
    _contentTableView.dataSource = self;
    _contentTableView.tag = 101;
    _contentTableView.bounces = NO;
    [_scrollView addSubview:_contentTableView];
    
}

-(void)crestSerialNumberView{
    _serialNumberTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SerialNumberColumnWide, self.frame.size.height)];
    _serialNumberTableView.tag = 102;
    _serialNumberTableView.delegate = self;
    _serialNumberTableView.dataSource = self;
    _serialNumberTableView.bounces = NO;
    _serialNumberTableView.showsVerticalScrollIndicator = NO;
    _serialNumberTableView.userInteractionEnabled = NO;
    [self addSubview:_serialNumberTableView];
}

#pragma mark - TableView Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return _headerLineHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _lineHeight;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView.tag == 101) {
        static NSString * cellId = @"searchCell";
        LMJFormCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell == nil) {
            cell = [[LMJFormCell alloc] init];
            [cell setCellColumnsWithColumnWidesArray:_allColumnWidesArr lineHeight:_lineHeight];
        }
        return cell;
    }
    static NSString * cellId = @"serialNumberCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] init];
        cell.layer.borderColor = [UIColor blackColor].CGColor;
        cell.layer.borderWidth = 1.0;
        cell.contentView.backgroundColor = [UIColor lightGrayColor];
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SerialNumberColumnWide, _lineHeight)];
        label.tag = 1001;
        label.layer.borderWidth = 1.0;
        label.layer.borderColor = [UIColor blackColor].CGColor;
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:15];
        [cell.contentView addSubview:label];
    }
    
    for (UIView * view in cell.contentView.subviews) {
        if (view.tag == 1001) {
            UILabel * label = (UILabel *)view;
            label.text = [NSString stringWithFormat:@"%d",indexPath.row +1];
        }
    }
    
    
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (tableView.tag == 101) {
        return _contentTableHeadView;
    }
    
    return _serialNumberTableHeadView;
}
#pragma mark - ScrollView Delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = _contentTableView.contentOffset.y;
    CGPoint timeOffsetY = _serialNumberTableView.contentOffset;
    timeOffsetY.y = offsetY;
    _serialNumberTableView.contentOffset = timeOffsetY;
    if(offsetY==0){
        _serialNumberTableView.contentOffset=CGPointZero;
    }
}


@end
