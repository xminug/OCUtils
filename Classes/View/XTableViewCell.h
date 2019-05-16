
//  XTableViewCell.h
//  ShoesSeller
//
//  Created by minug on 15/11/21.
//  Copyright © 2015年 minug. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MUCommon.h"

@class XButton;

@interface XTableViewCell : UITableViewCell

@property (nonatomic , weak) UILabel * leftL ;
@property (nonatomic , weak) UILabel * rightL ;
@property (nonatomic , weak) UILabel * contentL ;
@property (nonatomic , weak) UIImageView * imageV ;
@property (nonatomic , weak) UIView * line ;
@property (nonatomic , weak) XButton * btn ;

@end
