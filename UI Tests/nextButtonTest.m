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
        [tester tapViewWithAccessibilityLabel:kBack];
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
        
        // Fill firstname and lastname textfields
        [tester enterText:name intoViewWithAccessibilityLabel:kFirstTextField];
        [tester enterText:surname intoViewWithAccessibilityLabel:kSecondTextField];
        
        UITextField *first = (UITextField*)[tester waitForTappableViewWithAccessibilityLabel:kFirstTextField];
        XCTAssertTrue([first.text isEqualToString:name]);
        
        UITextField *second = (UITextField*)[tester waitForTappableViewWithAccessibilityLabel:kSecondTextField];
        XCTAssertTrue([second.text isEqualToString:surname]);
        
        [tester tapViewWithAccessibilityLabel:kDoneButton];
        
        [tester waitForViewWithAccessibilityLabel:kFirstViewTitle];
    } else {
        [tester fail];
    }
}

- (void)testTextFieldValidation {
    if ([tester tryFindingViewWithAccessibilityLabel:kFirstViewTitle error:NULL]) {
        [tester tapViewWithAccessibilityLabel:kNextButtonLabel];
    } else {
        [tester fail];
    }
    
    if ([tester waitForViewWithAccessibilityLabel:kSecondViewTitle]) {
        NSString *name = @"Alessio";
        
        // Fill firstname and lastname textfields
        [tester enterText:name intoViewWithAccessibilityLabel:kFirstTextField];
        
        UITextField *first = (UITextField*)[tester waitForTappableViewWithAccessibilityLabel:kFirstTextField];
        XCTAssertTrue([first.text isEqualToString:name]);
        
        [tester tapViewWithAccessibilityLabel:kDoneButton];
        
        [tester waitForViewWithAccessibilityLabel:kAlertTitle];
        
    } else {
        [tester fail];
    }
}

@end
