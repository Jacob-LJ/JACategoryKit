#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "UIView+JAFrame.h"
#import "UIView+JALayer.h"
#import "UIView+JAUtil.h"

FOUNDATION_EXPORT double JACategoryKitVersionNumber;
FOUNDATION_EXPORT const unsigned char JACategoryKitVersionString[];

