//
//  KIFUITestActor+EXAdditions.m
//  KIFTest
//
//  Created by Alessio Roberto on 14/04/16.
//  Copyright © 2016 alessio. All rights reserved.
//

#import "KIFUITestActor+EXAdditions.h"
#import "Constants.h"

@implementation KIFUITestActor (EXAdditions)

- (void)navigateToFirstView {
    if ([tester tryFindingTappableViewWithAccessibilityLabel:@"Back" error:NULL]) {
        [tester tapViewWithAccessibilityLabel:@"Back"];
    } else if ([tester tryFindingTappableViewWithAccessibilityLabel:kCloseButtonLabel error:NULL]) {
        [tester tapViewWithAccessibilityLabel:kCloseButtonLabel];
    }
}

@end
