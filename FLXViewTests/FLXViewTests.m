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

- (void)testIntegralFrames {
    FLXView *flexView = [[FLXView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];

    UILabel *view = [[UILabel alloc] init];
    view.flx_layoutStrategy = [FLXLayoutStrategy fixed:CGSizeMake(20.5, 20.5)];
    [flexView addSubview:view];

    [flexView layoutSubviews];

    XCTAssertEqual(view.bounds.size.width,  21);
    XCTAssertEqual(view.bounds.size.height, 21);
}

@end
