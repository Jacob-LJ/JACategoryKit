//
//  UIView+JAUtil.m
//  JACategoryKit
//
//  Created by Jacob_Liang on 2018/1/9.
//

#import "UIView+JAUtil.h"

@implementation UIView (JAUtil)

- (CGPoint)ja_anchorPoint {
    return self.layer.anchorPoint;
}

- (void)setJa_anchorPoint:(CGPoint)ja_anchorPoint {
    
    CGPoint oldOrigin = self.frame.origin;
    self.layer.anchorPoint = ja_anchorPoint;
    CGPoint newOrigin = self.frame.origin;
    
    CGPoint transition;
    transition.x = newOrigin.x - oldOrigin.x;
    transition.y = newOrigin.y - oldOrigin.y;
    
    self.center = CGPointMake (self.self.center.x - transition.x, self.center.y - transition.y);
}

- (void)resetOriginAnchorPoint {
    self.ja_anchorPoint = CGPointMake(0.5f, 0.5f);
}

- (CGFloat)ja_rotateAngle {
    CGFloat radius = atan2f(self.transform.b, self.transform.a);
    CGFloat degree = radius * (180 / M_PI);
    if (degree < 0) {
        degree = degree + 360;
    }
    return degree;
}

- (UITabBarController *)ja_tabbarController {
    
    UITabBarController *tabbarVC = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    return tabbarVC;
}

+ (instancetype)ja_viewFromXib {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
}

- (UIViewController *)ja_viewController {
    UIResponder *nextRes = [self nextResponder];
    
    do {
        if ([nextRes isKindOfClass:[UIViewController class]]) {
            return  (UIViewController *)nextRes;
            
        }
        nextRes = [nextRes nextResponder];
    } while (nextRes != nil);
    return nil;
}

- (void)ja_detectScrollsToTopViews {
    for (UIView* view in self.subviews) {
        if ([view isKindOfClass:UIScrollView.class]) {
            UIScrollView *scrollView = (UIScrollView *)view;
            scrollView.scrollsToTop = NO;
        }
        
        [view ja_detectScrollsToTopViews];
    }
}


+ (void)showOscillatoryAnimationWithLayer:(CALayer *)layer type:(JAOscillatoryAnimationType)type{
    NSNumber *animationScale1 = type == JAOscillatoryAnimationToBigger ? @(1.15) : @(0.5);
    NSNumber *animationScale2 = type == JAOscillatoryAnimationToBigger ? @(0.92) : @(1.15);
    
    [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
        [layer setValue:animationScale1 forKeyPath:@"transform.scale"];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
            [layer setValue:animationScale2 forKeyPath:@"transform.scale"];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
                [layer setValue:@(1.0) forKeyPath:@"transform.scale"];
            } completion:nil];
        }];
    }];
}

- (void)ja_rotateAnimationWithAngle:(CGFloat)angle {
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
        self.transform = CGAffineTransformRotate(self.transform, angle);
    } completion:nil];
}

- (void)ja_rotateAnimationIdentity {
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
        self.transform = CGAffineTransformIdentity;
    } completion:nil];
}

#pragma mark - Constraint
- (NSLayoutConstraint *)ja_heightConstraint{
    NSArray *allConstrint = self.constraints;
    for (NSLayoutConstraint *constraint in allConstrint) {
        if (constraint.firstItem == self && constraint.secondItem == nil && constraint.firstAttribute == NSLayoutAttributeHeight) {
            return constraint;
        }
    }
    return nil;
}

- (NSLayoutConstraint *)ja_widthConstraint{
    NSArray *allConstrint = self.constraints;
    for (NSLayoutConstraint *constraint in allConstrint) {
        if (constraint.firstItem == self && constraint.secondItem == nil && constraint.firstAttribute == NSLayoutAttributeWidth) {
            return constraint;
        }
    }
    return nil;
}

// Move via offset
- (void)ja_moveBy:(CGPoint)delta
{
    CGPoint newcenter = self.center;
    newcenter.x += delta.x;
    newcenter.y += delta.y;
    self.center = newcenter;
}

// Scaling
- (void)ja_scaleBy:(CGFloat)scaleFactor
{
    CGRect newframe = self.frame;
    newframe.size.width *= scaleFactor;
    newframe.size.height *= scaleFactor;
    self.frame = newframe;
}

@end
