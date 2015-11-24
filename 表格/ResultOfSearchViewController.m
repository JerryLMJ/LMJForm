//
//  ResultOfSearchViewController.m
//  银行人
//
//  Created by apple on 14-8-21.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "ResultOfSearchViewController.h"
#import "LMJFormCell.h"

@interface ResultOfSearchViewController ()
{
    UIScrollView * _scrollView;
    
    UITableView * _contentTableView;
    UITableView * _serialNumberTableView;
    
    UIView * _contentTableHeadView;
    UIView * _serialNumberTableHeadView;
}
@end

@implementation ResultOfSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
	
    [self creatHeadView];
    [self creatContentView];
    [self crestSerialNumberView];
    
}

-(void)creatHeadView{
    _contentTableHeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 40)];
    
    NSArray * titleArray = [NSArray arrayWithObjects:@"行业",@"区域",@"时间",@"所有制规模",@"资产报酬率(%)[累计]",@"资产报酬率(%)[当期]",@"销售利润率(%)[累计]",@"销售利润率(%)[当期]",@"销售毛利率(%)[累计]",@"销售毛利率(%)[当期]",@"行业亏损面(%)[累计]",@"行业亏损面(%)[当期]",@"期末亏损企业数目(个)[累计]",@"期末亏损企业数目(个)[当期]",@"亏损企业亏损总额(千元)[累计]",@"亏损企业亏损总额(千元)[当期]",@"亏损总额增长率(%)[累计]",@"亏损总额增长率(%)[当期]", nil];
    
    for (int i = 0; i < 18; i++) {
        UIView * subView = [[UIView alloc] initWithFrame:CGRectMake(100 *i, 0, 100, 40)];
        subView.backgroundColor = [UIColor lightGrayColor];
        subView.layer.borderColor = [UIColor blackColor].CGColor;
        subView.layer.borderWidth = 1.0;
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        [label setNumberOfLines:0];
        label.text = [titleArray objectAtIndex:i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14];
        [subView addSubview:label];
        
        [_contentTableHeadView addSubview:subView];
    }
    
    
    
    _serialNumberTableHeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    _serialNumberTableHeadView.layer.borderColor = [UIColor blackColor].CGColor;
    _serialNumberTableHeadView.layer.borderWidth = 1.0;
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    label.text = @"序号";
    label.backgroundColor = [UIColor lightGrayColor];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentCenter;
    [_serialNumberTableHeadView addSubview:label];
}

-(void)creatContentView{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(40, iOS7?20:0, 280, self.view.frame.size.height - (iOS7?20:0))];
    _scrollView.contentSize = CGSizeMake(100 *18, _scrollView.frame.size.height);
    _scrollView.bounces = NO;
    [self.view addSubview:_scrollView];
    
    
    _contentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 100 *18, _scrollView.frame.size.height)];
    _contentTableView.delegate = self;
    _contentTableView.dataSource = self;
    _contentTableView.tag = 101;
    _contentTableView.bounces = NO;
    [_scrollView addSubview:_contentTableView];
    
}

-(void)crestSerialNumberView{
    _serialNumberTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, iOS7?20:0, 40, self.view.frame.size.height - (iOS7?20:0))];
    _serialNumberTableView.tag = 102;
    _serialNumberTableView.delegate = self;
    _serialNumberTableView.dataSource = self;
    _serialNumberTableView.bounces = NO;
    _serialNumberTableView.showsVerticalScrollIndicator = NO;
    _serialNumberTableView.userInteractionEnabled = NO;
    [self.view addSubview:_serialNumberTableView];
}

#pragma mark - TableView Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView.tag == 101) {
        static NSString * cellId = @"searchCell";
        LMJFormCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell == nil) {
            cell = [[LMJFormCell alloc] init];
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
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
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
            label.text = [NSString stringWithFormat:@"%ld",indexPath.row +1];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
