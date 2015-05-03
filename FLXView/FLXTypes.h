@import Foundation;

typedef NS_ENUM(NSInteger, FLXChildAlignment) {
    FLXChildAlignmentStart = 1,
    FLXChildAlignmentCenter = 2,
    FLXChildAlignmentEnd = 3,
    FLXChildAlignmentStretch = 4,
};

typedef NS_ENUM(NSInteger, FLXDirection) {
    FLXDirectionColumn = 0,
    FLXDirectionRow = 1
};

typedef NS_ENUM(NSInteger, FLXJustification) {
    FLXJustificationStart = 0,
    FLXJustificationCenter = 1,
    FLXJustificationEnd = 2,
    FLXJustificationSpaceBetween = 3,
    FLXJustificationSpaceAround = 4,
};

typedef NS_ENUM(NSInteger, FLXSelfAlignment) {
    FLXSelfAlignmentAuto = 0,
    FLXSelfAlignmentStart = 1,
    FLXSelfAlignmentCenter = 2,
    FLXSelfAlignmentEnd = 3,
    FLXSelfAlignmentStretch = 4,
};

typedef struct FLXMargins {
    CGFloat top, left, bottom, right;
} FLXMargins;

static inline FLXMargins FLXMarginsMake(CGFloat top, CGFloat right, CGFloat bottom, CGFloat left) {
    return (FLXMargins){ .top = top, .right = right, .bottom = bottom, .left = left };
}

typedef struct FLXPadding {
    CGFloat top, left, bottom, right;
} FLXPadding;

static inline FLXPadding FLXPaddingMake(CGFloat top, CGFloat right, CGFloat bottom, CGFloat left) {
    return (FLXPadding){ .top = top, .right = right, .bottom = bottom, .left = left };
}
