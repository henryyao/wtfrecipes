//
//  Video.m
//  wtfrecipes
//
//  Created by Henry Yao on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Video.h"
#import "Marker.h"


@implementation Video

@dynamic videoTitle, videoId, markers, ingredients, totalSteps, thumbnailURL;

- (NSArray *)sortedMarkers {
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"position" ascending:YES];
	NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:&sortDescriptor count:1];
	
	NSMutableArray *m = [[[NSMutableArray alloc] initWithArray:[self.markers allObjects]] autorelease];
	[m sortUsingDescriptors:sortDescriptors];
  
	[sortDescriptor release];
	[sortDescriptors release];

  return m;
}
- (NSArray *)sortedIngredients {
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"displayOrder" ascending:YES];
	NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:&sortDescriptor count:1];
	
	NSMutableArray *i = [[[NSMutableArray alloc] initWithArray:[self.ingredients allObjects]] autorelease];
	[i sortUsingDescriptors:sortDescriptors];
  
	[sortDescriptor release];
	[sortDescriptors release];
  
  return i;
}

@end
