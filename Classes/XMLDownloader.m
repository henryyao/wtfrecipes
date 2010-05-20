//
//  XMLDownloader.m
//  wtfrecipes
//
//  Created by Henry Yao on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "XMLDownloader.h"
#import "TouchXML.h"

@implementation XMLDownloader

@synthesize buffer, conn, done;

// Detach a new thread and feed this method to it
- (void)downloadAndParse:(NSURL *)url {
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
  self.buffer = [NSMutableData data];
  done = NO;
  //[[NSURLCache sharedURLCache] removeAllCachedResponses];
  NSURLRequest *req = [NSURLRequest requestWithURL:url];
  conn = [[NSURLConnection alloc] initWithRequest:req delegate:self];
  [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
  if (conn != nil) {
    do {
      [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    } while (!done);
  }
  [pool release];
}

#pragma mark NSURLConnection Delegate methods
// Forward errors to the delegate.
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
  [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Unable to connect to the Internet, perhaps try again later." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
  [alert show];
  [alert release];
  done = YES;
  self.conn = nil;
}

// Called when a chunk of data has been downloaded.
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
  // Append downloaded chunk of data to buffer.
  [buffer appendData:data];
}

// When connection is finished loading--can start parsing.
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
  [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
  self.conn = nil;
  // Set done to YES to exit the run loop.
  done = YES; 
}

@end

