//
//  modelViewControllTests.m
//  KIFTest
//
//  Created by Alessio Roberto on 14/04/16.
//  Copyright © 2016 alessio. All rights reserved.
//

#import <KIF/KIF.h>

#import "KIFUITestActor+EXAdditions.h"
#import "Constants.h"

@interface modelViewControllTests : KIFTestCase

@end

@implementation modelViewControllTests

- (void)beforeEach
{
    [tester navigateToFirstView];
}

- (void)testViewController {
    [tester tapViewWithAccessibilityLabel:kModalButtonLabel];
    [tester waitForViewWithAccessibilityLabel:kModalViewTitle];
    [tester tapViewWithAccessibilityLabel:kCloseButtonLabel];
    
    [tester waitForTappableViewWithAccessibilityLabel:kFirstViewTitle];
}

- (void)testCells {
    [tester tapViewWithAccessibilityLabel:kModalButtonLabel];
    
    if ([tester tryFindingViewWithAccessibilityLabel:kModalViewTitle error:NULL]) {
        UITableView *tableView = (UITableView *)[tester waitForTappableViewWithAccessibilityLabel:kTableView];
        [tester tapRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0] inTableView:tableView];
        
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]];
        XCTAssertTrue([cell.textLabel.text isEqualToString:@"a"]);
    } else {
        [tester fail];
    }
}

@end
