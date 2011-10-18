//
//  MyAsyncTest.m
//  MobileTDDExample
//
//  Created by Ray on 10/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>

@interface MyAsyncTest : GHAsyncTestCase {}
@end

@implementation MyAsyncTest

-(void) testURLConnection {
    [self prepare];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com"]];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    
    // Wait until notify called for timeout (seconds); If notify is not called with kGHUnitWaitStatusSuccess then
    // we will throw an error.
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:10.0];
    
    [connection release];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // Notify of success, specifying the method where wait is called.
    // This prevents stray notifies from affecting other tests.
    [self notify:kGHUnitWaitStatusSuccess forSelector:@selector(testURLConnection)];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // Notify of connection failure
    [self notify:kGHUnitWaitStatusFailure forSelector:@selector(testURLConnection)];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    GHTestLog(@"%@", [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease]);
} 

@end
