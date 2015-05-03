#import "FLXData.h"

#import "FLXLayoutStrategy.h"

NS_ASSUME_NONNULL_BEGIN

@implementation FLXData

#pragma mark - Lifecycle

- (instancetype)init {
    self = [super init];
    if (self == nil) return nil;

    _flex = 0;
    _layoutStrategy = [FLXLayoutStrategy sizeToFit];
    _selfAlignment = FLXSelfAlignmentAuto;

    return self;
}

@end

NS_ASSUME_NONNULL_END
