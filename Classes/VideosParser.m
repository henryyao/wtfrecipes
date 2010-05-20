//
//  VideosParser.m
//  wtfrecipes
//
//  Created by Henry Yao on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "VideosParser.h"
#import "Video.h"
#import "Utils.h"


@implementation VideosParser
@synthesize delegate, parsedVideos;

- (void)parseVideos:(NSURL *)url {
  NSLog(@"parseVideos: %@", url);
  [NSThread detachNewThreadSelector:@selector(downloadAndParse:) toTarget:self withObject:url];
}

- (Video *)parseVideo:(CXMLElement *)videoData {
  // parse and create a Video object
  Video *video = [[[Video alloc] init] autorelease];
  
  video.videoTitle = [Utils stringValueFromElement:videoData named:@"title"];
  video.videoId = [Utils stringValueFromElement:videoData named:@"id"];

  return video;
}

- (void)dealloc {
  [parsedVideos release];
  [super dealloc];
}


#pragma mark NSURLConnection Delegate methods
// Forward errors to the delegate.
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
  [super connection:connection didFailWithError:error];
  [self performSelectorOnMainThread:@selector(parseError:) withObject:error waitUntilDone:NO];
}

// When connection is finished loading--can start parsing.
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
  // parse our data buffer.
  NSError *xmlError = nil;
  CXMLDocument *xmlDoc = [[CXMLDocument alloc] initWithData:buffer options:0 error:&xmlError];
  if(xmlError==nil) {
    NSArray *videos = [xmlDoc nodesForXPath:@"//videos/video" error:nil];
    self.parsedVideos = [NSMutableArray array];
    for(CXMLElement *videoData in videos) {
      [self.parsedVideos addObject:[self parseVideo:videoData]];
    }
  }
  else {
    NSLog(@"Error: %@", xmlError);
  }
  [xmlDoc release];
  [xmlError release];
  [self performSelectorOnMainThread:@selector(parseEnded) withObject:nil waitUntilDone:NO];
  [super connectionDidFinishLoading:connection];
}

- (void)parseEnded {
  if (self.delegate != nil && [self.delegate respondsToSelector:@selector(videosParser:didParse:)] && [parsedVideos count] > 0) {
    [self.delegate videosParser:self didParse:parsedVideos];
  }
  [self.parsedVideos removeAllObjects];
}

- (void)parseError:(NSError *)error {
  if (self.delegate != nil && [self.delegate respondsToSelector:@selector(videosParser:didFailWithError:)]) {
    [self.delegate videosParser:self didFailWithError:error];
  }
}

@end
