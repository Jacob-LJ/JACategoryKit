//
//  UIView+JAFrame.h
//  JACategoryKit
//
//  Created by Jacob_Liang on 2018/1/9.
//

#import <UIKit/UIKit.h>

@interface UIView (JAFrame)

@property (nonatomic, assign) CGFloat ja_x;
@property (nonatomic, assign) CGFloat ja_y;
@property (nonatomic, assign) CGPoint ja_origin;


@property (nonatomic, assign) CGFloat ja_width;
@property (nonatomic, assign) CGFloat ja_height;
@property (nonatomic, assign) CGSize ja_size;


@property  (nonatomic, assign) CGFloat ja_top;
@property  (nonatomic, assign) CGFloat ja_left;
@property  (nonatomic, assign) CGFloat ja_bottom;
@property  (nonatomic, assign) CGFloat ja_right;


@property (nonatomic, assign) CGFloat ja_centerX;
@property (nonatomic, assign) CGFloat ja_centerY;

@end
