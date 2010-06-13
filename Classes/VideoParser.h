//
//  VideoParser.h
//  wtfrecipes
//
//  Created by Henry Yao on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLDownloader.h"
#import "Video.h"


@class VideoParser;

@protocol VideoParserDelegate <NSObject>

@optional
- (void)videoParser:(VideoParser *)parser didFailWithError:(NSError *)error;
- (void)videoParser:(VideoParser *)parser didParse:(Video *)video;

@end

@interface VideoParser : XMLDownloader {
  id <VideoParserDelegate> delegate;
  Video *video;
  NSManagedObjectContext *insertionContext;
  NSEntityDescription *markerEntityDescription;
}

@property (nonatomic, assign) id <VideoParserDelegate> delegate;
@property (nonatomic, retain) Video *video;
@property (nonatomic, retain) NSManagedObjectContext *insertionContext;
@property (nonatomic, retain, readonly) NSEntityDescription *markerEntityDescription;

- (void)parseVideo:(NSURL *)url;
- (void)cancel;


@end
