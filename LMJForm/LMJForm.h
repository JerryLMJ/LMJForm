//
//  LMJForm.h
//  LMJForm
//
//  Version:1.0.0
//
//  Created by MajorLi on 14-12-3.
//  Copyright (c) 2014年 杰睿科技. All rights reserved.
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
