//
//  UIView+JALayer.m
//  JACategoryKit
//
//  Created by Jacob_Liang on 2018/1/9.
//

#import "UIView+JALayer.h"

@implementation UIView (JALayer)

#pragma mark - Corner 圆角处理
- (void)ja_roundCorners:(UIRectCorner)corner radius:(CGFloat)radius{
    
    CGRect bounds = self.bounds;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                                   byRoundingCorners:corner
                                                         cornerRadii:CGSizeMake(radius, radius)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = bounds;
    maskLayer.path = maskPath.CGPath;
    
    self.layer.mask = maskLayer;
    
    CAShapeLayer*   frameLayer = [CAShapeLayer layer];
    frameLayer.frame = bounds;
    frameLayer.path = maskPath.CGPath;
    //    frameLayer.strokeColor = [UIColor redColor].CGColor;
    frameLayer.fillColor = nil;
    
    [self.layer addSublayer:frameLayer];
}

- (void)ja_roundTopCornersRadius:(CGFloat)radius {
    [self ja_roundCorners:(UIRectCornerTopLeft|UIRectCornerTopRight) radius:radius];
}

- (void)ja_roundBottomCornersRadius:(CGFloat)radius {
    [self ja_roundCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight) radius:radius];
}

- (void)ja_roundLeftCornerRadius:(CGFloat)radius {
    [self ja_roundCorners:(UIRectCornerTopLeft | UIRectCornerBottomLeft) radius:radius];
}

- (void)ja_roundRightCornerRadius:(CGFloat)radius{
    [self ja_roundCorners:(UIRectCornerTopRight | UIRectCornerBottomRight) radius:radius];
}

#pragma mark - 添加 带颜色的layer边
- (void)ja_topBorderWidth:(CGFloat)width color:(UIColor *)color {
    CALayer* layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, self.frame.size.width, width);
    layer.backgroundColor = color.CGColor;
    [self.layer addSublayer:layer];
}

- (void)ja_leftBorderWidth:(CGFloat)width color:(UIColor *)color {
    CALayer* layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, width, self.frame.size.height);
    layer.backgroundColor = color.CGColor;
    [self.layer addSublayer:layer];
}

- (void)ja_bottomBorderWidth:(CGFloat)width color:(UIColor *)color {
    CALayer* layer = [CALayer layer];
    layer.frame = CGRectMake(0, self.frame.size.height - width, self.frame.size.width, width);
    layer.backgroundColor = color.CGColor;
    [self.layer addSublayer:layer];
}

- (void)ja_rightBorderWidth:(CGFloat)width color:(UIColor *)color {
    CALayer* layer = [CALayer layer];
    layer.frame = CGRectMake(self.frame.size.width - width, 0, width, self.frame.size.height);
    layer.backgroundColor = color.CGColor;
    [self.layer addSublayer:layer];
}

#pragma mark - 截屏
+ (UIImage *)ja_snapshotWindow {
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height), NO, 0);
    [[UIApplication sharedApplication].keyWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 * 截取inputView
 * scale - The scale factor to apply to the bitmap. If you specify a value of 0.0, the scale factor is set to the scale factor of the device’s main screen.
 *
 */
+ (UIImage *)ja_snapshoFromView:(UIView *)inputView WithScale:(CGFloat)scale {
    UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, NO, scale);
    [inputView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 * 获取tableView的截图
 * clipEdeInsets : default is UIEdgeInsetsZero;
 */
+ (UIImage *)ja_getTableViewImage:(UITableView *)tableView withClipEdeInsets:(UIEdgeInsets)clipEdeInsets {
    
    UIImage *viewImage = nil;
    UITableView *scrollView = tableView;
    CGSize finalSize = CGSizeMake(scrollView.contentSize.width - (clipEdeInsets.right + clipEdeInsets.left), scrollView.contentSize.height - (clipEdeInsets.top + clipEdeInsets.bottom));
    UIGraphicsBeginImageContextWithOptions(finalSize, scrollView.opaque, 0.0);
    {
        CGPoint savedContentOffset = scrollView.contentOffset;
        CGRect savedFrame = scrollView.frame;
        
        scrollView.contentOffset = CGPointZero;
        scrollView.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        if (context == NULL)
        {
            return nil;
        }
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, -clipEdeInsets.left, -clipEdeInsets.top);
        
        [scrollView.layer renderInContext: context];
        CGContextRestoreGState(context);
        
        viewImage = UIGraphicsGetImageFromCurrentImageContext();
        
        scrollView.contentOffset = savedContentOffset;
        scrollView.frame = savedFrame;
    }
    UIGraphicsEndImageContext();
    
    return viewImage;
}

@end
