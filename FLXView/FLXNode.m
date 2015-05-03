#import "UIView+FLXNode.h"

#import "FLXLayoutStrategy.h"
#import "FLXLayoutStrategy+Internal.h"
#import "FLXView.h"
#import "Layout.h"

#import "FLXNode.h"

NS_ASSUME_NONNULL_BEGIN

static bool FLXAlwaysDirty(void *contex);

static css_node_t *FLXGetChild(void *contex, int index);

static css_dim_t FLXMeasure(void *contex, float maxWidth);

@interface FLXNode ()

@property (readonly, nonatomic, assign) css_node_t *node;

@end

@implementation FLXNode

#pragma mark - Lifecycle

- (instancetype)initWithView:(UIView *)view {
    self = [super init];
    if (self == nil) return nil;

    _children = @[];

    _node = new_css_node();
    _node->context = (__bridge void *)self;
    _node->get_child = FLXGetChild;
    _node->is_dirty = FLXAlwaysDirty;
    _node->measure = [view isKindOfClass:FLXView.class] ? NULL : FLXMeasure;

    _layoutStrategy = [FLXLayoutStrategy sizeToFit];
    _view = view;

    return self;
}

- (void)dealloc {
    free_css_node(_node);
}

#pragma mark - Properties

- (FLXChildAlignment)childAlignment {
    return (FLXChildAlignment)self.node->style.align_items;
}

- (void)setChildAlignment:(FLXChildAlignment )childAlignment {
    self.node->style.align_items = (css_align_t)childAlignment;
}

- (void)setChildren:(NSArray *)children {
    for (FLXNode *child in _children) {
        child.parent = nil;
    }

    self.node->children_count = (int)children.count;

    _children = [children copy];

    for (FLXNode *child in _children) {
        child.parent = self;
    }
}

- (FLXDirection)direction {
    return (FLXDirection)self.node->style.flex_direction;
}

- (void)setDirection:(FLXDirection)direction {
    self.node->style.flex_direction = (css_flex_direction_t)direction;
}

- (CGFloat)flex {
    return self.node->style.flex;
}

- (void)setFlex:(CGFloat )flex {
    self.node->style.flex = flex;
}

- (FLXJustification)justification {
    return (FLXJustification)self.node->style.justify_content;
}

- (void)setJustification:(FLXJustification )justification {
    self.node->style.justify_content = (css_justify_t)justification;
}

- (FLXMargins)margins {
    return (FLXMargins){
        .left = self.node->style.margin[CSS_LEFT],
        .top = self.node->style.margin[CSS_TOP],
        .right = self.node->style.margin[CSS_RIGHT],
        .bottom = self.node->style.margin[CSS_BOTTOM]
    };
}

- (void)setMargins:(FLXMargins)margins {
    self.node->style.margin[CSS_LEFT] = margins.left;
    self.node->style.margin[CSS_TOP] = margins.top;
    self.node->style.margin[CSS_RIGHT] = margins.right;
    self.node->style.margin[CSS_BOTTOM] = margins.bottom;
}

- (CGPoint)origin {
    return (CGPoint){
        .x = self.node->layout.position[CSS_LEFT],
        .y = self.node->layout.position[CSS_TOP],
    };
}

- (void)setOrigin:(CGPoint)origin {
    self.node->layout.position[CSS_LEFT] = origin.x;
    self.node->layout.position[CSS_TOP] = origin.y;
}

- (FLXPadding)padding {
    return (FLXPadding){
        .left = self.node->style.padding[CSS_LEFT],
        .top = self.node->style.padding[CSS_TOP],
        .right = self.node->style.padding[CSS_RIGHT],
        .bottom = self.node->style.padding[CSS_BOTTOM]
    };
}

- (void)setPadding:(FLXPadding)padding {
    self.node->style.padding[CSS_LEFT] = padding.left;
    self.node->style.padding[CSS_TOP] = padding.top;
    self.node->style.padding[CSS_RIGHT] = padding.right;
    self.node->style.padding[CSS_BOTTOM] = padding.bottom;
}

- (FLXSelfAlignment)selfAlignment {
    return (FLXSelfAlignment)self.node->style.align_self;
}

- (void)setSelfAlignment:(FLXSelfAlignment)selfAlignment {
    self.node->style.align_self = (css_align_t)selfAlignment;
}

- (CGSize)size {
    return (CGSize){
        .width = self.node->layout.dimensions[CSS_WIDTH],
        .height = self.node->layout.dimensions[CSS_HEIGHT],
    };
}

- (void)setSize:(CGSize)size {
    self.node->layout.dimensions[CSS_WIDTH] = size.width;
    self.node->layout.dimensions[CSS_HEIGHT] = size.height;
}

- (BOOL )wrap {
    return self.node->style.flex_wrap == CSS_WRAP;
}

- (void)setWrap:(BOOL )wrap {
    self.node->style.flex_wrap = wrap ? CSS_WRAP : CSS_NOWRAP;
}

#pragma mark - FLXNode

- (void)layout {
    [self layoutWithMaxWidth:CSS_UNDEFINED];
}

- (void)layoutWithMaxWidth:(CGFloat)maxWidth {
    layoutNode(self.node, maxWidth);
}

@end

static bool FLXAlwaysDirty(void *contex) {
    return true;
}

static css_node_t *FLXGetChild(void *context, int index) {
    FLXNode *self = (__bridge FLXNode *)context;

    FLXNode *childNode = self.children[index];

    return childNode.node;
}

static css_dim_t FLXMeasure(void *context, float maxWidth) {
    FLXNode *self = (__bridge FLXNode *)context;

    CGSize size = [self.layoutStrategy sizeForView:self.view containerSize:self.parent.size maxWidth:maxWidth];

    return (css_dim_t){ size.width, size.height };
}

NS_ASSUME_NONNULL_END
