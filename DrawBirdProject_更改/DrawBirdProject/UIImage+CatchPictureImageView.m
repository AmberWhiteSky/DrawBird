//
//  UIImage+CatchPictureImageView.m
//  屏幕截图
//
//  Created by AmberWhiteSky on 15/8/28.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "UIImage+CatchPictureImageView.h"

@implementation UIImage (CatchPictureImageView)
+(instancetype)  catchPicWithView :(UIView *) view{
    //1.开启上下文
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0);
    
    //2. 将控制器view的layer渲染到上下文
    [view.layer renderInContext :UIGraphicsGetCurrentContext()];
    
    //3.取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();

    //4.结束上下文
    UIGraphicsEndImageContext();

    
    return  newImage;
    
}
@end
