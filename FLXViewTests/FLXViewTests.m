@import FLXView;
@import UIKit;
@import XCTest;

@interface FlexTests : XCTestCase

@end

@implementation FlexTests

- (void)testLayout {
    FLXView *flexView = [[FLXView alloc] init];

    flexView.bounds = CGRectMake(0, 0, 300, 300);
    flexView.childAlignment = FLXChildAlignmentCenter;
    flexView.direction = FLXDirectionRow;

    UIView *a = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 100)];
    a.flx_margins = (FLXMargins){ 0, 10, 0, 10 };
    a.flx_flex = 75;
    [flexView addSubview:a];

    UIView *b = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
    b.flx_margins = (FLXMargins){ 0, 0, 0, 10 };
    b.flx_flex = 15;
    [flexView addSubview:b];

    UIView *c = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 180)];
    c.flx_margins = (FLXMargins){ 0, 0, 0, 10 };
    c.flx_flex = 10;
    [flexView addSubview:c];

    [flexView layoutSubviews];

    XCTAssertEqual(flexView.frame.size.width, 300);
    XCTAssertEqual(flexView.frame.size.height, 300);

    XCTAssertEqual(a.frame.origin.x, 10);
    XCTAssertEqual(a.frame.origin.y, 100);
    XCTAssertEqual(a.frame.size.width, 195);
    XCTAssertEqual(a.frame.size.height, 100);

    [flexView layoutSubviews];

    XCTAssertEqual(flexView.frame.size.width, 300);
    XCTAssertEqual(flexView.frame.size.height, 300);

    XCTAssertEqual(a.frame.origin.x, 10);
    XCTAssertEqual(a.frame.origin.y, 100);
    XCTAssertEqual(a.frame.size.width, 195);
    XCTAssertEqual(a.frame.size.height, 100);
}

- (void)testLayoutWithHiddenViews {
    FLXView *flexView = [[FLXView alloc] init];

    flexView.bounds = CGRectMake(0, 0, 300, 300);
    flexView.childAlignment = FLXChildAlignmentCenter;
    flexView.direction = FLXDirectionRow;

    UIView *a = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 100)];
    a.flx_margins = (FLXMargins){ 0, 10, 0, 10 };
    a.flx_flex = 60;
    [flexView addSubview:a];

    UIView *b = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
    b.flx_margins = (FLXMargins){ 0, 0, 0, 10 };
    b.flx_flex = 10;
    [flexView addSubview:b];
    b.hidden = YES;

    UIView *c = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 180)];
    c.flx_margins = (FLXMargins){ 0, 0, 0, 10 };
    c.flx_flex = 30;
    [flexView addSubview:c];
    c.hidden = YES;
    c.flx_layoutWhenHidden = YES;

    [flexView layoutSubviews];

    XCTAssertEqual(flexView.frame.size.width, 300);
    XCTAssertEqual(flexView.frame.size.height, 300);

    XCTAssertEqual(a.frame.origin.x, 10);
    XCTAssertEqual(a.frame.origin.y, 100);
    XCTAssertEqual(a.frame.size.width, 180);
    XCTAssertEqual(a.frame.size.height, 100);

    c.flx_layoutWhenHidden = NO;
    [flexView layoutSubviews];

    XCTAssertEqual(flexView.frame.size.width, 300);
    XCTAssertEqual(flexView.frame.size.height, 300);

    XCTAssertEqual(a.frame.origin.x, 10);
    XCTAssertEqual(a.frame.origin.y, 100);
    XCTAssertEqual(a.frame.size.width, 280);
    XCTAssertEqual(a.frame.size.height, 100);
}

- (void)testDefaults {
    FLXView *flexView = [[FLXView alloc] init];

    XCTAssertEqual(flexView.childAlignment, FLXChildAlignmentStart);
    XCTAssertEqual(flexView.direction, FLXDirectionColumn);
    XCTAssertEqual(flexView.justification, FLXJustificationStart);
    XCTAssertEqual(flexView.padding.top, 0);
    XCTAssertEqual(flexView.padding.right, 0);
    XCTAssertEqual(flexView.padding.bottom, 0);
    XCTAssertEqual(flexView.padding.left, 0);
    XCTAssertEqual(flexView.wrap, NO);
}

@end
