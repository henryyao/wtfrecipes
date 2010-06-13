//
//  VideosParser.h
//  wtfrecipes
//
//  Created by Henry Yao on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLDownloader.h"


@class VideosParser;

@protocol VideosParserDelegate <NSObject>

@optional
- (void)videosParser:(VideosParser *)parser didFailWithError:(NSError *)error;
- (void)videosParser:(VideosParser *)parser didParse:(NSArray *)parsedVideos;

@end


@interface VideosParser : XMLDownloader {
  id <VideosParserDelegate> delegate;
  NSMutableArray *parsedVideos;
  NSManagedObjectContext *insertionContext;
  NSEntityDescription *videoEntityDescription;
}

@property (nonatomic, assign) id <VideosParserDelegate> delegate;
@property (nonatomic, retain) NSMutableArray *parsedVideos;
@property (nonatomic, retain) NSManagedObjectContext *insertionContext;
@property (nonatomic, retain, readonly) NSEntityDescription *videoEntityDescription;

- (void)parseVideos:(NSURL *)url;

@end
