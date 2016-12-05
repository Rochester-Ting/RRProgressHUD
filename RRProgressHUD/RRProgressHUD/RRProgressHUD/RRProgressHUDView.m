//
//  RRProgressHUDView.m
//  RRProgressHUD
//
//  Created by Rochester on 5/12/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "RRProgressHUDView.h"

@interface RRProgressHUDView ()
/******指示器******/
@property (nonatomic,strong) UIActivityIndicatorView *indicator;
@end
@implementation RRProgressHUDView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blackColor];
        self.layer.cornerRadius = 10.0f;
        [self.indicator startAnimating];
    }
    return self;
}
- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:13.0f];
        _label.textColor = [UIColor whiteColor];
        _label.numberOfLines = 0;
        [self addSubview:_label];
    }
    return _label;
}
- (UIActivityIndicatorView *)indicator{
    if (!_indicator) {
        _indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [self addSubview:_indicator];
    }
    return _indicator;
}
- (void)setStatus:(NSString *)status{
    _status = status;
    self.label.text = status;
    CGFloat indicatorWH = 70.0f;
    CGRect frame = self.frame;
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    frame.size.width = 100;
//    frame.size.height = 100;
    frame.origin.x = (screenW - frame.size.width)/2;
    frame.origin.y = (screenH - frame.size.height)/2;
    // 计算文字的高度
    CGRect textRect = [status boundingRectWithSize:CGSizeMake(100.0f, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.label.font} context:nil];
    
    CGFloat labelW = textRect.size.width;
    if (labelW > frame.size.width) {
        labelW = indicatorWH;
    }
    CGFloat labelH = textRect.size.height;
    
    frame.size.height = 100 + labelH;
    self.frame = frame;
//    NSLog(@"---%.2f----%.2f",labelW,labelH);
    
    self.indicator.frame = CGRectMake((self.frame.size.width - indicatorWH)/2, (100 - indicatorWH)/2, indicatorWH, indicatorWH);
    self.label.frame = CGRectMake(self.indicator.frame.origin.x, self.indicator.frame.size.height + self.indicator.frame.origin.y, labelW, labelH);
//    NSLog(@"----%@",NSStringFromCGRect(self.label.frame));
}


@end
