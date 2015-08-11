//
//  LXToolBarButton.m
//  ToolBar
//
//  Created by 兜麦 on 15/8/7.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import "LXToolBarButton.h"
#import "UIView+ExtensionFrame.h"
//
@interface LXToolBarButton ()
//
//@property (nonatomic,assign) CGFloat titleW;
//
//@property (nonatomic,assign) CGSize imageSize;
//
@end
//
//
@implementation LXToolBarButton
//
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    if (self = [super initWithFrame:frame])
//    {
//        
//        // 设置title图片
//        [self setImage:[UIImage imageNamed:@"icon_filt_01"] forState:UIControlStateNormal];
//        self.titleLabel.contentMode = UIViewContentModeCenter;
//        // 设置title选中图片(预先设置)
////        [self setImage:[UIImage imageNamed:@"icon_filt_01"] forState:UIControlStateSelected];
//    }
//    return self;
//}
//- (void)awakeFromNib
//{
//    
//    // 计算按钮文字实际的宽度
//    self.titleW = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.titleLabel.font} context:nil].size.width;
//    
//    self.imageSize = self.imageView.image.size;
//}
//
//
//
//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    
//    // 获得按钮本身的尺寸
//    CGFloat width = self.width;
//    CGFloat height = self.height;
//    
//    // 获得按钮文字的宽度
//    CGFloat titleW = self.titleLabel.width;
//    CGFloat titleH = height;
//    
//    // 计算按钮文字的x值
//    CGFloat titleX = (width - titleW - self.imageView.width) * 0.5;
//    // 设置frame
//    self.titleLabel.frame = CGRectMake(titleX, 0, titleW, titleH);
//    
//    // 计算按钮图片的y值
//    CGFloat imageY = (height - self.imageView.height)  * 0.5;
//    self.imageView.frame = CGRectMake(titleX + 20 ,imageY, self.imageView.width, self.imageView.height);
//    
//}



@end
