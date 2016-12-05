//
//  RRImageHUDView.m
//  RRProgressHUD
//
//  Created by Rochester on 5/12/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "RRImageHUDView.h"

@interface RRImageHUDView ()
/******label******/
@property (nonatomic,strong) UILabel *label;
@end
@implementation RRImageHUDView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blackColor];
        self.layer.cornerRadius = 10.0f;
    }
    return self;
}
- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:15.0f];
        _label.textColor = [UIColor whiteColor];
        _label.numberOfLines = 0;
        [self addSubview:_label];
    }
    return _label;
}
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_imageView];
    }
    return _imageView;
}
- (void)setImage:(UIImage *)image{
    _image = image;
    self.imageView.image = image;
    
    const CGFloat margin = 10.0f;
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    
    CGRect frame = self.frame;
    frame.size.width = 100.0f + margin;
    frame.origin.x = (screenW - frame.size.width)/2;
    frame.size.height = 100.0f + margin;
    frame.origin.y = (screenH - frame.size.height)/2;
    self.frame = frame;
    self.imageView.frame = CGRectMake((self.frame.size.width - 40.0f)/2, (self.frame.size.height - 40.0f)/2, 40.0f, 40.0f);
}
- (void)setStatus:(NSString *)status{
    _status = status;
    // 计算文字的高度
    CGRect textRect = [status boundingRectWithSize:CGSizeMake(110.0f - 20.0f, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.label.font} context:nil];
    self.label.frame = CGRectMake(10.0f, self.imageView.frame.origin.y + self.imageView.frame.size.height + 10, 90.0f, textRect.size.height);
    CGRect frame = self.frame;
    if (textRect.size.height < 30) {
        textRect.size.height = 40;
    }
    frame.size.height = self.imageView.frame.origin.y + self.imageView.frame.size.height + textRect.size.height + 10;
    self.frame = frame;
    
    
    self.label.text = status;
}
@end
