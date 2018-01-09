//
//  UIView+JALayer.h
//  JACategoryKit
//
//  Created by Jacob_Liang on 2018/1/9.
//

#import <UIKit/UIKit.h>

@interface UIView (JALayer)

#pragma mark - Corner 圆角处理
- (void)ja_roundCorners:(UIRectCorner)corner radius:(CGFloat)radius;

- (void)ja_roundTopCornersRadius:(CGFloat)radius;
- (void)ja_roundBottomCornersRadius:(CGFloat)radius;
- (void)ja_roundLeftCornerRadius:(CGFloat)radius;
- (void)ja_roundRightCornerRadius:(CGFloat)radius;

#pragma mark - 添加 带颜色的layer边
- (void)ja_topBorderWidth:(CGFloat)width color:(UIColor *)color;
- (void)ja_leftBorderWidth:(CGFloat)width color:(UIColor *)color;
- (void)ja_bottomBorderWidth:(CGFloat)width color:(UIColor *)color;
- (void)ja_rightBorderWidth:(CGFloat)width color:(UIColor *)color;

#pragma mark - 截屏
+ (UIImage *)ja_snapshotWindow;
/**
 * 截取inputView
 */
+ (UIImage *)ja_snapshoFromView:(UIView *)inputView WithScale:(CGFloat)scale;

/**
 * 获取tableView的截图
 * clipEdeInsets : default is UIEdgeInsetsZero;
 */
+ (UIImage *)ja_getTableViewImage:(UITableView *)tableView withClipEdeInsets:(UIEdgeInsets)clipEdeInsets;

@end
