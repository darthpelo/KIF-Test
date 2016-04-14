//
//  nextButtonTest.m
//  KIFTest
//
//  Created by Alessio Roberto on 13/04/16.
//  Copyright © 2016 alessio. All rights reserved.
//

#import <KIF/KIF.h>

#import "KIFUITestActor+EXAdditions.h"
#import "Constants.h"

@interface nextButtonTest : KIFTestCase

@end

@implementation nextButtonTest

- (void)beforeEach
{
    [tester navigateToFirstView];
}

- (void)testNextPress {
    if ([tester tryFindingViewWithAccessibilityLabel:kFirstViewTitle error:NULL]) {
        [tester tapViewWithAccessibilityLabel:kNextButtonLabel];
    } else {
        [tester fail];
    }
    
    if ([tester waitForViewWithAccessibilityLabel:kSecondViewTitle]) {
        [tester tapViewWithAccessibilityLabel:@"Back"];
    } else {
        [tester fail];
    }
}

- (void)testTryFunctions {
    if ([tester tryFindingTappableViewWithAccessibilityLabel:@"Back" error:NULL]) {
        [tester tapViewWithAccessibilityLabel:@"Back"];
    } else {
        [tester fail];
    }
    
    if ([tester tryFindingTappableViewWithAccessibilityLabel:kModalButtonLabel error:NULL]) {
        [tester tapViewWithAccessibilityLabel:kModalButtonLabel];
    } else {
        [tester fail];
    }
}

- (void)testSecondView {
    if ([tester tryFindingViewWithAccessibilityLabel:kFirstViewTitle error:NULL]) {
        [tester tapViewWithAccessibilityLabel:kNextButtonLabel];
    } else {
        [tester fail];
    }
    
    if ([tester waitForViewWithAccessibilityLabel:kSecondViewTitle]) {
        NSString *name = @"Alessio";
        NSString *surname = @"Roberto";
        
        [tester enterText:name intoViewWithAccessibilityLabel:kFirstTextField];
        [tester enterText:surname intoViewWithAccessibilityLabel:kSecondTextField];
        
        UITextField *first = (UITextField*)[tester waitForTappableViewWithAccessibilityLabel:kFirstTextField];
        XCTAssertTrue([first.text isEqualToString:name]);
        
        UITextField *second = (UITextField*)[tester waitForTappableViewWithAccessibilityLabel:kSecondTextField];
        XCTAssertTrue([second.text isEqualToString:surname]);
        
        [tester tapViewWithAccessibilityLabel:@"Back"];
    } else {
        [tester fail];
    }
}

@end
