//
//  MyClass.m
//  MobileTDDExample
//
//  Created by Ray on 10/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <OCMock/OCMock.h>

@interface MyTest : SenTestCase { }
@end

@implementation MyTest

- (void) testStrings {
    NSString *string1 = @"a string";
    //GHTestLog(@"I can log to the GHUnit test console: %@", string1);
    
    STAssertNotNil(string1, nil);
    
    NSString *string2 = @"a string";
    
    STAssertEqualObjects(string1, string2, @"A customer error message. string1 shoud equals to: %@", string2);
}

- (void)testSimpleFail {
    STAssertTrue(NO, nil);
}

// simple test to ensure building, linking, and running test case works in the project
- (void)testOCMockPass {
    id mock = [OCMockObject mockForClass:NSString.class];
    [[[mock stub] andReturn:@"mocktest"] lowercaseString];
    
    NSString *returnValue = [mock lowercaseString];
    STAssertEqualObjects(@"mocktest", returnValue, @"Should have returned the expected string.");
}

- (void)testOCMockFail {
    id mock = [OCMockObject mockForClass:NSString.class];
    [[[mock stub] andReturn:@"mocktest"] lowercaseString];
    
    NSString *returnValue = [mock lowercaseString];
    STAssertEqualObjects(@"thisIsTheWrongValueToCheck", returnValue, @"Should have returned the expected string.");
}

@end
    
    
