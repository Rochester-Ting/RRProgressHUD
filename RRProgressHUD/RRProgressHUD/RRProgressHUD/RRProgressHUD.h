//
//  RRProgressHUD.h
//  RRProgressHUD
//
//  Created by Rochester on 5/12/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@interface RRProgressHUD : UIView
// 单例方法
+ (instancetype)sharedInstance;
// 设置hud的方法
- (void)setHUDView:(UIView *)HUDView;
// HUD的显示时间
- (void)showWithTime:(CGFloat)time;
// HUD隐藏
- (void)hide;
// 移除所有的HUD
- (void)hideAllHUDs;



// 提示文字文字不会自动隐藏
+ (void)showStatus:(NSString *)status;
// 提示文字并且会自动隐藏
+ (void)showStatus:(NSString *)status autoHide:(CGFloat)time;
// 移除提示
+ (void)hideHUD;
// 提示成功
+ (void)showSuccess;
// 提示成功,会自动隐藏,没有文字
+ (void)showSuccessAutoHide:(CGFloat)time;
// 提示成功,不能设置时间,有文字
+ (void)showSuccess:(NSString *)status;
// 提示成功,会自动隐藏,有文字
+ (void)showSuccess:(NSString *)status AutoHide:(CGFloat)time;
// 提示失败
+ (void)showError;
// 提示失败,会自动隐藏
+ (void)showErrorAutoHide:(CGFloat)time;
// 提示失败,不能设置时间,有文字
+ (void)showError:(NSString *)status;
// 提示失败,会自动隐藏,有文字
+ (void)showError:(NSString *)status AutoHide:(CGFloat)time;
// 提示正在加载,无文字,不能设置时间
+ (void)showProgress;
// 提示正在加载,无文字,能设置时间
+ (void)showProgressAutoHide:(CGFloat)time;
// 提示正在加载,无文字,不能设置时间
+ (void)showProgress:(NSString *)status;
// 提示正在加载,无文字,不能设置时间
+ (void)showProgress:(NSString *)status autoHide:(CGFloat)time;




@end
