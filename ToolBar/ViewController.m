//
//  ViewController.m
//  ToolBar
//
//  Created by 兜麦 on 15/8/6.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import "ViewController.h"
#import "LXToolBar.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,LXToolBarDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) LXToolBar *toolbar;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LXToolBar *toolbar = [[LXToolBar alloc] initWithBtnTitles:@[@"全部", @"待付款",@"未消费",@"已退款"]];
    toolbar.frame = CGRectMake(0, 0, self.view.frame.size.width, 44);
    [self.view addSubview:toolbar];
    self.toolbar = toolbar;
    toolbar.delegate = self;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];

}


#pragma mark tableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"setting";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

#pragma mark toolbar代理方法
- (void)toolBar:(LXToolBar *)toolBar didSelectButton:(LXToolBarButton *)button
{
    switch (button.tag) {
        case 0:
            NSLog(@"全部");
            break;
        case 1:
            NSLog(@"待付款");
            break;
        case 2:
            NSLog(@"未消费");
            break;
        case 3:
            NSLog(@"已退款");
            break;
            
        default:
            break;
    }
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}



@end
