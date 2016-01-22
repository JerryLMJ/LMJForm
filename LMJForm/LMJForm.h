//
//  LMJForm.h
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

#import <UIKit/UIKit.h>

@interface LMJForm : UIView<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

/*!
 * @brief 初始化表格控件
 * @param frame 表格控件的frame
 * @param HLHeight 表格第一行(栏目行)的高度
 * @param LHeight 表格内容每行的高度
 * @param formColumns 所有栏目数据，以LMJFormColumn为数组元素
 * @return 表格控件实例
 */
-(id)initWithFrame:(CGRect)frame headerLineHeight:(CGFloat)HLHeight lineHeight:(CGFloat)LHeight formColumns:(NSArray *)formColumns;

@end
