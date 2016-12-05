//
//  RRTextHUDView.h
//  RRProgressHUD
//
//  Created by Rochester on 5/12/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RRTextHUDView : UIView
/******显示提示框的文字******/
@property (nonatomic,strong) NSString *text;
/******uilabel******/
@property (nonatomic,strong) UILabel *label;
@end
