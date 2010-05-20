//
//  Video.m
//  wtfrecipes
//
//  Created by Henry Yao on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Video.h"


@implementation Video

@synthesize videoTitle, videoId, markers, ingredients;

- (id)init {
  self.markers = [NSMutableArray array];
  self.ingredients = [NSMutableArray array];
  
  return self;
}

- (void)dealloc {
  [markers release];
  [ingredients release];
  [super dealloc];
}

@end
