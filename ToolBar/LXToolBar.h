//
//  LXToolBar.h
//  ToolBar
//
//  Created by 兜麦 on 15/8/7.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXToolBarButton.h"

@class LXToolBar;

@protocol  LXToolBarDelegate <NSObject>
@optional;

- (void)toolBar:(LXToolBar *)toolBar didSelectButton:(LXToolBarButton *)button;

@end

@interface LXToolBar : UIView

@property (nonatomic, weak) id <LXToolBarDelegate> delegate;

- (instancetype)initWithBtnTitles:(NSArray *)titles;

@end
