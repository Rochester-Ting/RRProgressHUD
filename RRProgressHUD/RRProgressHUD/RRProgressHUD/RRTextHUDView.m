//
//  RRTextHUDView.m
//  RRProgressHUD
//
//  Created by Rochester on 5/12/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "RRTextHUDView.h"

@implementation RRTextHUDView
- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.numberOfLines = 0;
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = [UIColor whiteColor];
        _label.font = [UIFont systemFontOfSize:17.0];
        [self addSubview:self.label];
        
    }
    return _label;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blackColor];
        self.layer.cornerRadius = 7.0f;
    }
    return self;
}
- (void)setText:(NSString *)text{
    _text = text;
    self.label.text = text;
    
    const CGFloat margin = 10.0f;
    CGRect textRect = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, 100.0f) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.label.font} context:nil];
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    
    CGRect frame = self.frame;
    frame.size.width = textRect.size.width + 2 * margin;
    
    if (frame.size.width > screenW) {
        frame.size.width = screenW - 2 * margin;
    }
    
    frame.origin.x = (screenW - textRect.size.width) / 2;
    frame.size.height = textRect.size.height + 2 * margin;
    frame.origin.y = (screenH - textRect.size.height) / 2;
    
    self.frame = frame;
    self.label.frame = self.bounds;
    [self layoutIfNeeded];
    
    
}
@end
