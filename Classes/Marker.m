//
//  Marker.m
//  wtfrecipes
//
//  Created by Henry Yao on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Marker.h"


@implementation Marker

@dynamic markerTitle, markerText, stepNumber, markerType, thumbnailURL, timemarker, position;

- (void)setMarkerType:(NSString *)t {
  if(self.markerType!=nil) [markerType release], markerType=nil;
  markerType = [t retain];
  if(![self isaStep]) {
    self.markerTitle = self.markerType;
  }
}

- (BOOL)isaStep {
  return [self.markerType isEqualToString:@"Step"];
}


@end
