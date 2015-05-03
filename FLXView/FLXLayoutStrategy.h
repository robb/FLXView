@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface FLXLayoutStrategy : NSObject

+ (instancetype)sizeToFit;

+ (instancetype)fixed:(CGSize)size;

+ (instancetype)relative:(CGSize (^)(CGSize))block;

@end

NS_ASSUME_NONNULL_END
