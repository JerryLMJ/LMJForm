//
//  TestViewController.m
//  表格
//
//  Created by apple on 14-12-3.
//  Copyright (c) 2014年 杰睿科技. All rights reserved.
//

#import "TestViewController.h"

#import "LMJForm.h"
#import "LMJFormColumn.h"

@interface TestViewController ()

@end

@implementation TestViewController

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
    
    NSArray * titleArray = [NSArray arrayWithObjects:@"行业",@"区域",@"时间",@"所有制规模",@"资产报酬率(%)[累计]",@"资产报酬率(%)[当期]",@"销售利润率(%)[累计]",@"销售利润率(%)[当期]",@"销售毛利率(%)[累计]",@"销售毛利率(%)[当期]",@"行业亏损面(%)[累计]",@"行业亏损面(%)[当期]",@"期末亏损企业数目(个)[累计]",@"期末亏损企业数目(个)[当期]",@"亏损企业亏损总额(千元)[累计]",@"亏损企业亏损总额(千元)[当期]",@"亏损总额增长率(%)[累计]",@"亏损总额增长率(%)[当期]", nil];
    float wideArray[18] = {40,40,40,80,100,100,100,100,100,100,100,100,100,100,100,100,100,100};
    NSArray * idArray = [NSArray arrayWithObjects:@"001",@"002",@"003",@"004",@"005",@"006",@"007",@"008",@"009",@"010",@"011",@"012",@"013",@"014",@"015",@"016",@"017",@"018", nil];
    
    
    NSMutableArray * columnArr = [[NSMutableArray alloc] init];
    for (int i = 0; i <18; i++) {
        LMJFormColumn * column = [[LMJFormColumn alloc] init];
        column.columnId = [idArray objectAtIndex:i];
        column.title = [titleArray objectAtIndex:i];
        column.wide = wideArray[i];
        [columnArr addObject:column];
    }
    
    LMJForm * form = [[LMJForm alloc] initWithFrame:CGRectMake(10, 40, 300, 450) headerLineHeight:50 lineHeight:40 formColumns:columnArr];
    [self.view addSubview:form];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
