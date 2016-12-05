//
//  ViewController.m
//  RRProgressHUD
//
//  Created by Rochester on 5/12/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "ViewController.h"
#import "RRProgressHUD.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController
- (IBAction)btnClick:(id)sender {
//    [RRProgressHUD showStatus:@"哈哈哈哈" autoHide:2.0f];
//    [RRProgressHUD showSuccessAutoHide:1.0f];
//    [RRProgressHUD showSuccess:@"加载成功!" AutoHide:1.0f];
//    [RRProgressHUD showErrorAutoHide:1.0f];
//    [RRProgressHUD showError:@"加载失败" AutoHide:2.0f];
//    [RRProgressHUD showProgress:@"正在加载中"];
//    [RRProgressHUD showProgressAutoHide:1.0f];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"rr"];
}
#pragma mark - datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rr"];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"显示提示文字,不能设置时间";
            break;
        case 1:
            cell.textLabel.text = @"显示提示文字,能设置时间";
            break;
        case 2:
            cell.textLabel.text = @"显示成功,没有文字,不能设置时间";
            break;
        case 3:
            cell.textLabel.text = @"显示成功,没有文字,能设置时间";
            break;
        case 4:
            cell.textLabel.text = @"显示成功,有文字,不能设置时间";
            break;
        case 5:
            cell.textLabel.text = @"显示成功,有文字,能设置时间";
            break;
        case 6:
            cell.textLabel.text = @"显示进度,没有文字,不能设置时间";
            break;
        case 7:
            cell.textLabel.text = @"显示进度,没有文字,能设置时间";
            break;
        case 8:
            cell.textLabel.text = @"显示进度,有文字,不能设置时间";
            break;
        case 9:
            cell.textLabel.text = @"显示进度,有文字,能设置时间";
            break;
        default:
            break;
    }
    return cell;
}
#pragma mark - uitableviewdelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
//            cell.textLabel.text = @"显示提示文字,不能设置时间";
            [RRProgressHUD showStatus:@"我是大帅比"];
            break;
        case 1:
//            cell.textLabel.text = @"显示提示文字,能设置时间";
            [RRProgressHUD showStatus:@"我是大帅比" autoHide:1.0f];
            break;
        case 2:
//            cell.textLabel.text = @"显示成功,没有文字,不能设置时间";
            [RRProgressHUD showSuccess];
            break;
        case 3:
//            cell.textLabel.text = @"显示成功,没有文字,能设置时间";
            [RRProgressHUD showSuccessAutoHide:1.0f];
            break;
        case 4:
//            cell.textLabel.text = @"显示成功,有文字,不能设置时间";
            [RRProgressHUD showSuccess:@"加载成功哦" AutoHide:1.0f];
            break;
        case 5:
//            cell.textLabel.text = @"显示成功,有文字,能设置时间";
            [RRProgressHUD showSuccess:@"加载成功哦" AutoHide:1.0f];
            break;
        case 6:
//            cell.textLabel.text = @"显示进度,没有文字,不能设置时间";
            [RRProgressHUD showProgress];
            break;
        case 7:
//            cell.textLabel.text = @"显示进度,没有文字,能设置时间";
            [RRProgressHUD showProgressAutoHide:1.0f];
            break;
        case 8:
//            cell.textLabel.text = @"显示进度,有文字,不能设置时间";
            [RRProgressHUD showProgress:@"我是加载哦"];
            break;
        case 9:
//            [RRProgressHUD showProgress:@"我在加载哦" autoHide:1.0f];
            [RRProgressHUD showProgress:@"我是加载哦" autoHide:1.0f];
            break;
        default:
        break;    }
}
@end
