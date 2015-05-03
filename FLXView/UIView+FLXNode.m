#import "UIView+Flex.h"

#import "FLXNode.h"

#import "UIView+FLXNode.h"

@implementation UIView (FLXNode)

- (FLXNode *)flx_generateTree {
    FLXNode *node = [[FLXNode alloc] initWithView:self];

    node.flex = self.flx_flex;
    node.layoutStrategy = self.flx_layoutStrategy;
    node.margins = self.flx_margins;
    node.origin = CGPointZero;
    node.selfAlignment = self.flx_selfAlignment;
    node.size = CGSizeMake(NAN, NAN);

    return node;
}

@end
