//
//  RRImageHUDView.h
//  RRProgressHUD
//
//  Created by Rochester on 5/12/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RRImageHUDView : UIView
/******图片******/
@property (nonatomic,strong) UIImage *image;

/******图片******/
@property (nonatomic,strong) UIImageView *imageView;
/******status******/
@property (nonatomic,strong) NSString *status;
@end
