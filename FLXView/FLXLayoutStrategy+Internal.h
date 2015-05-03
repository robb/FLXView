@import UIKit;

#import <FLXView/FLXLayoutStrategy.h>

NS_ASSUME_NONNULL_BEGIN

@interface FLXLayoutStrategy ()

- (CGSize)sizeForView:(UIView *)view containerSize:(CGSize)containerSize maxWidth:(CGFloat)maxWidth;

@end

NS_ASSUME_NONNULL_END
