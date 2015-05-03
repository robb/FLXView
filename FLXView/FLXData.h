@import UIKit;

#import "FLXTypes.h"

@class FLXLayoutStrategy;

NS_ASSUME_NONNULL_BEGIN

@interface FLXData : NSObject

@property (readwrite, nonatomic, assign) CGFloat flex;

@property (readwrite, nonatomic, strong) FLXLayoutStrategy *layoutStrategy;

@property (readwrite, nonatomic, assign) FLXMargins margins;

@property (readwrite, nonatomic, assign) FLXSelfAlignment selfAlignment;

@end

NS_ASSUME_NONNULL_END
