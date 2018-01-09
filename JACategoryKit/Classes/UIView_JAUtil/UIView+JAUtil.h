//
//  UIView+JAUtil.h
//  JACategoryKit
//
//  Created by Jacob_Liang on 2018/1/9.
//

#import <UIKit/UIKit.h>


//目前暂时将未能成组的功能统一放在这里

typedef enum : NSUInteger {
    JAOscillatoryAnimationToBigger,
    JAOscillatoryAnimationToSmaller,
} JAOscillatoryAnimationType;

@interface UIView (JAUtil)

//更改锚点
@property (nonatomic, assign) CGPoint ja_anchorPoint;
- (void)resetOriginAnchorPoint;

//获得旋转的角度  0 ~ 360
@property (nonatomic, assign, readonly) CGFloat ja_rotateAngle;

/**
 当前View所在的tabbarController实例对象
 */
- (UITabBarController *)ja_tabbarController;

/**
 快速返回xib创建的View对象
 */
+ (instancetype)ja_viewFromXib;

/**
 当前View所在的Controller实例对象
 */
- (UIViewController *)ja_viewController;

/**
 递归获取view子控件中的Scrollview,并将其scrollsToTop属性设为NO
 */
- (void)ja_detectScrollsToTopViews;


/**
 放大缩小的震动效果
 
 @param layer view的layer
 @param type  放大 / 缩小 类型
 */
+ (void)showOscillatoryAnimationWithLayer:(CALayer *)layer type:(JAOscillatoryAnimationType)type;

/**
 旋转效果
 
 @param angle 角度
 */
- (void)ja_rotateAnimationWithAngle:(CGFloat)angle;
- (void)ja_rotateAnimationIdentity;

#pragma mark - Constraint
/**
 获取高度约束
 */
- (NSLayoutConstraint *)ja_heightConstraint;

/**
 获取宽度约束
 */
- (NSLayoutConstraint *)ja_widthConstraint;

/**
 按照给定定delta(point)改变View的origin值
 */
- (void)ja_moveBy:(CGPoint)delta;

/**
 按照给定的scaleFactor比例因子, 改变View的height 和 width
 */
- (void)ja_scaleBy:(CGFloat)scaleFactor;

@end
