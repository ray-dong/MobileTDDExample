//
//  MobileTDDExample - OCHamcrestTest.m
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
//  Created by: Ray
//

    // Class under test

    // Collaborators

    // Test support
#import <SenTestingKit/SenTestingKit.h>

// Uncomment the next two lines to use OCHamcrest for test assertions:
#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>


@interface OCHamcrestTest : SenTestCase
{
    
}
@end


@implementation OCHamcrestTest

- (void)testStringMatch
{
    NSString *s = @"FooBar";
    
    assertThat(s, is(@"FooBar"));
    
    assertThat(s, startsWith(@"Foo"));
    assertThat(s, endsWith(@"Bar"));
    assertThat(s, containsString(@"oo"));
    assertThat(s, equalToIgnoringCase(@"foobar"));
    
    assertThat(@" X \n  Y \t\t  Z \n", equalToIgnoringWhiteSpace(@"X Y Z"));
}

@end
