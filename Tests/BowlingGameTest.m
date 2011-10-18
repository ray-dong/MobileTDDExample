//
//  BowlingGameLib - BowlingGameTest.m
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
//  Created by: Ray
//
    
    // Class under test
#import "Game.h"

    // Collaborators

    // Test support
#import <SenTestingKit/SenTestingKit.h>

// Uncomment the next two lines to use OCHamcrest for test assertions:
//#define HC_SHORTHAND
//#import <OCHamcrestIOS/OCHamcrestIOS.h>


@interface BowlingGameTest : SenTestCase
{
    Game *game;
}
@end


@implementation BowlingGameTest

- (void) setUp {
    [super setUp];
    game = [[Game alloc] init];
}

- (void) tearDown {
    [game release];
    [super tearDown];
}

- (void)rollPins:(int)pins times:(int)n  {
  for(int i =0 ; i < n ; i++ ) {
        [game rollWithPinCount:pins];
    }

}
- (void) testGutterGame {
    int n = 20;
    int pins = 0;
    [self rollPins: pins times: n];

    STAssertEquals([game score], 0, nil);
}

- (void) testAllOnes {
    [self rollPins:1 times:20];
    STAssertEquals([game score], 20, nil);
}


@end
