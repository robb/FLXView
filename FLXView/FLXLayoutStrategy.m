#import "FLXLayoutStrategy.h"
#import "FLXLayoutStrategy+Internal.h"

NS_ASSUME_NONNULL_BEGIN

@interface FLXLayoutStrategySizeToFit : FLXLayoutStrategy

@end

@implementation FLXLayoutStrategySizeToFit

#pragma mark - FLXLayoutStrategy

- (CGSize)sizeForView:(UIView *)view containerSize:(CGSize)containerSize maxWidth:(CGFloat)maxWidth {
    return [view sizeThatFits:CGSizeMake(maxWidth, CGFLOAT_MAX)];
}

@end

@interface FLXLayoutStrategyFixed : FLXLayoutStrategy

- (instancetype)initWithSize:(CGSize)size NS_DESIGNATED_INITIALIZER;

@property (readonly, nonatomic, assign) CGSize size;

@end

@implementation FLXLayoutStrategyFixed

#pragma mark - Lifecycle

- (instancetype)initWithSize:(CGSize)size {
    self = [super init];
    if (self == nil) return nil;

    _size = size;

    return self;
}

#pragma mark - FLXLayoutStrategy

- (CGSize)sizeForView:(UIView *)view containerSize:(CGSize)containerSize maxWidth:(CGFloat)maxWidth {
    return self.size;
}

@end

@interface FLXLayoutStrategyRelative : FLXLayoutStrategy

- (instancetype)initWithBlock:(CGSize (^)(CGSize))block NS_DESIGNATED_INITIALIZER;

@property (readonly, nonatomic, copy) CGSize (^block)(CGSize);

@end

@implementation FLXLayoutStrategyRelative

#pragma mark - Lifecycle

- (instancetype)initWithBlock:(CGSize (^)(CGSize))block {
    self = [super init];
    if (self == nil) return nil;

    _block = [block copy];

    return self;
}

#pragma mark - FLXLayoutStrategy

- (CGSize)sizeForView:(UIView *)view containerSize:(CGSize)containerSize maxWidth:(CGFloat)maxWidth {
    return self.block(containerSize);
}

@end

@implementation FLXLayoutStrategy

#pragma mark - FLXLayoutStrategy

+ (instancetype)sizeToFit {
    static FLXLayoutStrategySizeToFit *sizeToFit;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sizeToFit = [[FLXLayoutStrategySizeToFit alloc] init];
    });
    return sizeToFit;
}

+ (instancetype)fixed:(CGSize)size {
    return [[FLXLayoutStrategyFixed alloc] initWithSize:size];
}

+ (instancetype)relative:(CGSize (^)(CGSize))block {
    return [[FLXLayoutStrategyRelative alloc] initWithBlock:block];
}

- (CGSize)sizeForView:(UIView *)view containerSize:(CGSize)containerSize maxWidth:(CGFloat)maxWidth {
    NSAssert(NO, @"Expected %@ to be overridden by subclass", NSStringFromSelector(_cmd));
    return CGSizeZero;
}

@end

NS_ASSUME_NONNULL_END
