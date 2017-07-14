//
//  UIImage+Original.m
//  29-网易彩票
//
//  Created by cl on 15/6/13.
//  Copyright (c) 2015年 sun. All rights reserved.
//

#import "UIImage+Original.h"

@implementation UIImage (Original)
-(UIImage *)originalImage
{
    return [self imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end
