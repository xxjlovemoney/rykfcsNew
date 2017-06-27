

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property CGFloat xxj_width;
@property CGFloat xxj_height;
@property CGFloat xxj_x;
@property CGFloat xxj_y;
@property CGFloat xxj_centerX;
@property CGFloat xxj_centerY;

@property (assign, nonatomic) CGSize size;
@property (assign, nonatomic) CGPoint origin;

/// 边线颜色
@property (nonatomic, strong) IBInspectable UIColor *borderColor;
/// 边线宽度
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
/// 圆角半径
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;


@end
