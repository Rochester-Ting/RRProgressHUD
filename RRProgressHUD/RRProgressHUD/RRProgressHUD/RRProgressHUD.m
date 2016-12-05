//
//  RRProgressHUD.m
//  RRProgressHUD
//
//  Created by Rochester on 5/12/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "RRProgressHUD.h"
#import "RRTextHUDView.h"
#import "RRImageHUDView.h"
#import "RRProgressHUDView.h"
@interface RRProgressHUD ()

@end
@implementation RRProgressHUD
// 单例
+ (instancetype)sharedInstance{
    static RRProgressHUD *rrHud = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rrHud = [[RRProgressHUD alloc] init];
    });
    return rrHud;
}
// 初始化
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
// 添加hud方法
- (void)setHUDView:(UIView *)HUDView{
    [self addSubview:HUDView];
}
// 弹出hud方法
- (void)showWithTime:(CGFloat)time{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (self.superview == nil) {
        [window addSubview:self];
    }
    // 检测出现的时长
    if (time > 0) {
        __weak typeof(self) weakSelf = self;
        // 在time秒以后将hud移除
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            __strong typeof (weakSelf) strongSelf = weakSelf;
            if (strongSelf) {
                [strongSelf hide];
            }
        });
    }
}
// 隐藏hud
- (void)hide{
    // 先移除先添加的hud
    UIView *firstHUD = self.subviews.firstObject;
    if (firstHUD) {
        [firstHUD removeFromSuperview];
        if (self.subviews.count == 0) {
            [self removeFromSuperview];
        }
    }else{
        [self removeFromSuperview];
    }
}
// 移除所有的hud
- (void)hideAllHUDs{
    // 遍历子控件,将他们全部移除
    for (UIView *objc in self.subviews) {
        [objc removeFromSuperview];
    }
    [self removeFromSuperview];
}

// 显示提示框
+ (void)showStatus:(NSString *)status{
    [self showStatus:status autoHide:3.0f];
}
// 显示提示框,并且可以设置时间隐藏
+ (void)showStatus:(NSString *)status autoHide:(CGFloat)time{
    RRProgressHUD *rrHUD = [RRProgressHUD sharedInstance];
    RRTextHUDView *textHUDView = [[RRTextHUDView alloc] init];
    textHUDView.text = status;
    [rrHUD setHUDView:textHUDView];
    [rrHUD showWithTime:time];
}
// 提示成功
+ (void)showSuccess{
    [self showSuccessAutoHide:4.0f];
}
// 提示成功会自动隐藏
+ (void)showSuccessAutoHide:(CGFloat)time{
    [self showSuccess:nil AutoHide:time];

}
// 提示成功,不会自动隐藏,可以设置文字
+ (void)showSuccess:(NSString *)status{
    [self showSuccess:status AutoHide:4.0f];
}
// 提示成功,会自动隐藏,有文字
+ (void)showSuccess:(NSString *)status AutoHide:(CGFloat)time{
    RRProgressHUD *rrHUD = [RRProgressHUD sharedInstance];
    RRImageHUDView *imageHUD = [[RRImageHUDView alloc] init];
    imageHUD.image = [UIImage imageNamed:@"success"];
    imageHUD.status = status;
    [rrHUD setHUDView:imageHUD];
    [rrHUD showWithTime:time];
}
// 提示失败
+ (void)showError{
    [self showErrorAutoHide:4.0f];
}
// 提示失败会自动隐藏
+ (void)showErrorAutoHide:(CGFloat)time{
    [self showError:nil AutoHide:time];
}
// 提示失败,不会自动隐藏,可以设置文字
+ (void)showError:(NSString *)status{
    [self showError:status AutoHide:4.0f];
}
// 提示成功,会自动隐藏,有文字
+ (void)showError:(NSString *)status AutoHide:(CGFloat)time{
    RRProgressHUD *rrHUD = [RRProgressHUD sharedInstance];
    RRImageHUDView *imageHUD = [[RRImageHUDView alloc] init];
    imageHUD.image = [UIImage imageNamed:@"error"];
    imageHUD.status = status;
    [rrHUD setHUDView:imageHUD];
    [rrHUD showWithTime:time];
}
// 提示加载进度,有文字
+ (void)showProgress:(NSString *)status{
//    [self showStatus:status autoHide:4.0f];
    [self showProgress:status autoHide:4.0f];
}
// 提示加载进度,有文字,可以设置时间
+ (void)showProgress:(NSString *)status autoHide:(CGFloat)time{
    RRProgressHUD *rrHUD = [RRProgressHUD sharedInstance];
    RRProgressHUDView *rrProgressView = [[RRProgressHUDView alloc] init];
    rrProgressView.status = status;
    [rrHUD setHUDView:rrProgressView];
    [rrHUD showWithTime:time];
}
// 提示加载进度,没有文字
+ (void)showProgress{
    [self showProgress:nil autoHide:4.0f];
}
// 提示加载进度,没有文字,可以设置时间
+ (void)showProgressAutoHide:(CGFloat)time{
    [self showProgress:nil autoHide:time];
}
// 隐藏提示框
+ (void)hideHUD{
    [[RRProgressHUD sharedInstance] hide];
}
// 设置尺寸
- (void)layoutSubviews{
    [super layoutSubviews];
    if (self.superview) {
        self.frame = self.superview.bounds;
        for (UIView *subView in self.subviews) {
            subView.center = self.center;
        }
    }
}
@end
