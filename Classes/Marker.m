//
//  Marker.m
//  wtfrecipes
//
//  Created by Henry Yao on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Marker.h"


@implementation Marker

@synthesize markerTitle, markerText, stepNumber;
@dynamic markerType;

- (void)setMarkerType:(NSString *)t {
  if(self.markerType!=nil) [markerType release], markerType=nil;
  markerType = [t retain];
  if(![self isaStep]) {
    self.markerTitle = markerType;
  }
}

- (NSString *)markerType {
  return markerType;
}

- (BOOL)isaStep {
  return [self.markerType isEqualToString:@"Step"];
}

- (void)dealloc {
  [markerTitle release];
  [markerType release];
  [markerText release];
  [super dealloc];
}

@end
