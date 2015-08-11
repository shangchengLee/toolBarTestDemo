//
//  LXToolBar.m
//  ToolBar
//
//  Created by 兜麦 on 15/8/7.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import "LXToolBar.h"
#import "UIView+ExtensionFrame.h"
#import "LXToolBarButton.h"
@interface LXToolBar ()

/** 全部 */
@property(nonatomic,strong)UIButton *allBtn;

/** 待付款 */
@property(nonatomic,strong)UIButton *payBtn;

/** 未消费 */
@property(nonatomic,strong)UIButton *consumeBtn;

/** 已退款 */
@property(nonatomic,strong)UIButton *refundBtn;

/** 所有的按钮 */
@property(nonatomic,strong)NSMutableArray *buttons;

/** 所有的分割线 */
@property(nonatomic,strong)NSMutableArray *dividers;

/** 下面红色线条 */
@property (nonatomic, strong) UIView *redView;

/** 下面灰色线条 */
@property (nonatomic, strong) UIView *grayView;

@property (strong, nonatomic) LXToolBarButton *selectedButton;

@end


@implementation LXToolBar

- (UIView *)grayView
{
    if (!_grayView)
    {
        _grayView = [[UIView alloc] init];
        _grayView.backgroundColor = [UIColor grayColor];
        _grayView.alpha = 0.2;
        [self addSubview:_grayView];
        
    }
    return _grayView;
}



- (UIView *)redView
{
    if (!_redView)
    {
        _redView = [[UIView alloc] init];
        _redView.backgroundColor = [UIColor redColor];
    }
    return _redView;
}



- (NSMutableArray *)buttons
{
    if (!_buttons)
    {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (NSMutableArray *)dividers
{
    if (!_dividers)
    {
        _dividers = [NSMutableArray array];
    }
    return _dividers;
}

- (instancetype)initWithBtnTitles:(NSArray *)titles
{
    if (self = [super init])
    {
        for (NSString *title in titles)
        {
            [self addBtnWithTitle:title];
        }
    }
    return self;
}


- (LXToolBarButton *)addBtnWithTitle:(NSString *)title
{
    LXToolBarButton *btn = [LXToolBarButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.contentMode = UIViewContentModeCenter;
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:btn];
    [btn setTag:self.buttons.count];
    [self.buttons addObject:btn];
    [self addDivider];
    
    if (self.buttons.count == 1)
    {
        self.selectedButton = btn;
        btn.selected = YES;
        [btn addSubview:self.redView];
    }
    return btn;
}


- (void)btnClick:(LXToolBarButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(toolBar:didSelectButton:)])
    {
        [self.delegate toolBar:self didSelectButton:btn];
    }
    self.selectedButton.selected = NO;
    btn.selected = YES;
    self.selectedButton = btn;
    [btn addSubview:self.redView];
}

- (void)addDivider
{
    UIImageView *divider = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"li_line"]];
    [self addSubview:divider];
    [self.dividers addObject:divider];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    NSInteger buttonCount = self.buttons.count;
    CGFloat buttonW = self.width / buttonCount;
    for (int i = 0; i < buttonCount; i ++)
    {
        UIButton *btn = self.buttons[i];
        btn.height = self.height;
        btn.width = buttonW;
        btn.x = i * buttonW;
        btn.y = 0;
    }
    
    NSUInteger dividerCount = self.dividers.count;
    for (int i = 0; i < dividerCount; i++)
    {
        UIImageView *dividerImage = self.dividers[i];
        dividerImage.width = 1;
        dividerImage.y = 12;
        dividerImage.height = self.height - 20;
        dividerImage.x = (1 + i) * buttonW;
    }
    
    self.grayView.frame = CGRectMake(0, self.height - 1, self.width, 1);
    self.redView.frame = CGRectMake(0, CGRectGetHeight(self.selectedButton.frame)-2, CGRectGetWidth(self.selectedButton.frame), 2);
}

@end
