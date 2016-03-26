#import <objc/runtime.h>

#import "FLXData.h"

#import "UIView+Flex.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Flex_Private)

@property (readonly, nonatomic, strong) FLXData *flx_data;

@end

@implementation UIView (Flex)

- (FLXData *)flx_data {
    FLXData *data = objc_getAssociatedObject(self, _cmd);

    if (data == nil) {
        data = [[FLXData alloc] init];
        objc_setAssociatedObject(self, _cmd, data, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }

    return data;
}

- (CGFloat)flx_flex {
    return self.flx_data.flex;
}

- (void)setFlx_flex:(CGFloat)flex {
    self.flx_data.flex = flex;

    [self.superview setNeedsLayout];
}

- (FLXLayoutStrategy *)flx_layoutStrategy {
    return self.flx_data.layoutStrategy;
}

- (void)setFlx_layoutStrategy:(FLXLayoutStrategy *)layoutStrategy {
    self.flx_data.layoutStrategy = layoutStrategy;

    [self.superview setNeedsLayout];
}

- (FLXMargins)flx_margins {
    return self.flx_data.margins;
}

- (void)setFlx_margins:(FLXMargins)margins {
    self.flx_data.margins = margins;

    [self.superview setNeedsLayout];
}

- (FLXSelfAlignment)flx_selfAlignment {
    return self.flx_data.selfAlignment;
}

- (void)setFlx_selfAlignment:(FLXSelfAlignment)selfAlignment {
    self.flx_data.selfAlignment = selfAlignment;

    [self.superview setNeedsLayout];
}

- (BOOL)flx_layoutWhenHidden {
    return [objc_getAssociatedObject(self, @selector(flx_layoutWhenHidden)) boolValue];
}

- (void)setFlx_layoutWhenHidden:(BOOL)flx_layoutWhenHidden {
    if (flx_layoutWhenHidden == self.flx_layoutWhenHidden)
        return;

    objc_setAssociatedObject(self, @selector(flx_layoutWhenHidden), @(flx_layoutWhenHidden), OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    if (self.hidden)
        [self.superview layoutSubviews];
}

@end

NS_ASSUME_NONNULL_END
