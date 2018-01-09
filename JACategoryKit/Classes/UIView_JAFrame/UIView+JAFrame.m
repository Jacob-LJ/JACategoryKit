//
//  UIView+JAFrame.m
//  JACategoryKit
//
//  Created by Jacob_Liang on 2018/1/9.
//

#import "UIView+JAFrame.h"

@implementation UIView (JAFrame)

//x
- (CGFloat)ja_x {
    return self.frame.origin.x;
}

- (void)setJa_x:(CGFloat)ja_x {
    CGRect frame = self.frame;
    frame.origin.x = ja_x;
    self.frame = frame;
}

//y
- (CGFloat)ja_y {
    return self.frame.origin.y;
}

- (void)setJa_y:(CGFloat)ja_y {
    CGRect frame = self.frame;
    frame.origin.y = ja_y;
    self.frame = frame;
}

//origin
- (CGPoint)ja_origin {
    return self.frame.origin;
}

- (void)setJa_origin:(CGPoint) aPoint {
    CGRect newframe = self.frame;
    newframe.origin = aPoint;
    self.frame = newframe;
}

//width
- (CGFloat)ja_width {
    return self.frame.size.width;
}

- (void)setJa_width:(CGFloat)ja_width {
    CGRect frame = self.frame;
    frame.size.width = ja_width;
    self.frame = frame;
}

//height
- (CGFloat)ja_height {
    return self.frame.size.height;
}

- (void)setJa_height:(CGFloat)ja_height {
    CGRect frame = self.frame;
    frame.size.height = ja_height;
    self.frame = frame;
}

//size
- (CGSize)ja_size {
    return self.frame.size;
}

- (void)setJa_size:(CGSize)aSize {
    CGRect newframe = self.frame;
    newframe.size = aSize;
    self.frame = newframe;
}

//top
- (CGFloat)ja_top {
    return self.frame.origin.y;
}

- (void)setJa_top:(CGFloat)newtop {
    CGRect newframe = self.frame;
    newframe.origin.y = newtop;
    self.frame = newframe;
}

//left
- (CGFloat)ja_left {
    return self.frame.origin.x;
}

- (void)setJa_left:(CGFloat)newleft {
    CGRect newframe = self.frame;
    newframe.origin.x = newleft;
    self.frame = newframe;
}

//bottom
- (CGFloat)ja_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setJa_bottom:(CGFloat)newbottom{
    CGRect newframe = self.frame;
    newframe.origin.y = newbottom - self.frame.size.height;
    self.frame = newframe;
}

//right
- (CGFloat)ja_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setJa_right:(CGFloat)newright {
    CGFloat delta = newright - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta ;
    self.frame = newframe;
}

//centerX
- (CGFloat)ja_centerX {
    return self.center.x;
}

- (void)setJa_centerX:(CGFloat)ja_centerX {
    CGPoint center = self.center;
    center.x = ja_centerX;
    self.center = center;
}

//centerY
- (CGFloat)ja_centerY {
    return self.center.y;
}

- (void)setJa_centerY:(CGFloat)ja_centerY {
    CGPoint center = self.center;
    center.y = ja_centerY;
    self.center = center;
}

@end
