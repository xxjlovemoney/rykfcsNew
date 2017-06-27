//
//  UIView+Frame.m
//  BuDeJie
//
//  Created by xiaomage on 16/3/12.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (void)setXxj_height:(CGFloat)xxj_height
{
    CGRect rect = self.frame;
    rect.size.height = xxj_height;
    self.frame = rect;
}

- (CGFloat)xxj_height
{
    return self.frame.size.height;
}

- (CGFloat)xxj_width
{
    return self.frame.size.width;
}
- (void)setXxj_width:(CGFloat)xxj_width
{
    CGRect rect = self.frame;
    rect.size.width = xxj_width;
    self.frame = rect;
}

- (CGFloat)xxj_x
{
    return self.frame.origin.x;
    
}

- (void)setXxj_x:(CGFloat)xxj_x
{
    CGRect rect = self.frame;
    rect.origin.x = xxj_x;
    self.frame = rect;
}

- (void)setXxj_y:(CGFloat)xxj_y
{
    CGRect rect = self.frame;
    rect.origin.y = xxj_y;
    self.frame = rect;
}

- (CGFloat)xxj_y
{

    return self.frame.origin.y;
}

- (void)setXxj_centerX:(CGFloat)xxj_centerX
{
    CGPoint center = self.center;
    center.x = xxj_centerX;
    self.center = center;
}

- (CGFloat)xxj_centerX
{
    return self.center.x;
}

- (void)setXxj_centerY:(CGFloat)xxj_centerY
{
    CGPoint center = self.center;
    center.y = xxj_centerY;
    self.center = center;
}

- (CGFloat)xxj_centerY
{
    return self.center.y;
}



- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

//==========================================圆角的设置========================
// 实现文件
- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
    // 栅格化 - 提高性能
    // 设置栅格化后，图层会被渲染成图片，并且缓存，再次使用时，不会重新渲染
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.layer.shouldRasterize = YES;
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}


@end
