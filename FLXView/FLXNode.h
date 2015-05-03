@import UIKit;

#import "FLXTypes.h"

@class FLXLayoutStrategy;

NS_ASSUME_NONNULL_BEGIN

@interface FLXNode : NSObject

- (instancetype)initWithView:(UIView *)view NS_DESIGNATED_INITIALIZER;

@property (readwrite, nonatomic, assign) FLXChildAlignment childAlignment;

@property (readwrite, nonatomic, copy) NSArray *children;

@property (readwrite, nonatomic, assign) FLXDirection direction;

@property (readwrite, nonatomic, assign) CGFloat flex;

@property (readwrite, nonatomic, assign) FLXJustification justification;

@property (readwrite, nonatomic, strong) FLXLayoutStrategy *layoutStrategy;

@property (readwrite, nonatomic, assign) FLXMargins margins;

@property (readwrite, nonatomic, assign) CGPoint origin;

@property (readwrite, nonatomic, assign) FLXPadding padding;

@property (readwrite, nonatomic, weak, nullable) FLXNode *parent;

@property (readwrite, nonatomic, assign) FLXSelfAlignment selfAlignment;

@property (readwrite, nonatomic, assign) CGSize size;

@property (readonly, nonatomic, weak, nullable) UIView *view;

@property (readwrite, nonatomic, assign) BOOL wrap;

- (void)layout;

- (void)layoutWithMaxWidth:(CGFloat)maxWidth;

@end

NS_ASSUME_NONNULL_END
