//
//  VideoParser.m
//  wtfrecipes
//
//  Created by Henry Yao on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "VideoParser.h"
#import "Video.h"
#import "Marker.h"
#import "Ingredient.h"
#import "Utils.h"


@implementation VideoParser
@synthesize delegate, video, markerEntityDescription, insertionContext;

- (void)parseVideo:(NSURL *)url {
  NSLog(@"parseVideo: %@", url);
  [NSThread detachNewThreadSelector:@selector(downloadAndParse:) toTarget:self withObject:url];
}

- (void)dealloc {
  delegate = nil;
  [video release];
  [super dealloc];
}

- (Marker *)parseMarker:(CXMLElement *)markerData {
  // parse and create a Marker object
  //Marker *marker = [[[Marker alloc] init] autorelease];
  Marker *marker = [[[Marker alloc] initWithEntity:self.markerEntityDescription insertIntoManagedObjectContext:self.insertionContext] autorelease];
  
  marker.markerTitle = [Utils stringValueFromElement:markerData named:@"title"];
  marker.markerType = [Utils stringValueFromElement:markerData named:@"type"];
  marker.markerText = [Utils stringValueFromElement:markerData named:@"textile-text"];
  marker.position = [Utils numberValueFromElement:markerData named:@"position"];
  
  //NSLog(@"marker: %@, %@, %@", marker.markerTitle, marker.markerType, marker.markerText);
  
  return marker;
}

- (NSEntityDescription *)markerEntityDescription {
  if (markerEntityDescription == nil) {
    markerEntityDescription = [[NSEntityDescription entityForName:@"Marker" inManagedObjectContext:self.insertionContext] retain];
  }
  return markerEntityDescription;
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
    NSArray *dataBlock = [xmlDoc nodesForXPath:@"//video/ingredients/ingredient" error:nil];
    int displayOrder = 0;
    for(CXMLElement *data in dataBlock) {
      Ingredient *i = [[[Ingredient alloc] initWithEntity:[NSEntityDescription entityForName:@"Ingredient" inManagedObjectContext:self.insertionContext] insertIntoManagedObjectContext:self.insertionContext] autorelease];
      i.displayOrder = [NSNumber numberWithInt:displayOrder];
      i.item = [[data stringValue] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
      [video addIngredientsObject:i];
      displayOrder++;
    }
    int stepNumber = 1;
    dataBlock = [xmlDoc nodesForXPath:@"//video/markers/marker" error:nil];
    for(CXMLElement *data in dataBlock) {
      Marker *m = [self parseMarker:data];
      if([m isaStep]) [m setValue:[NSNumber numberWithInt:stepNumber] forKey:@"stepNumber"], stepNumber++;
      [video addMarkersObject:m];
    }
    [video setValue:[NSNumber numberWithInt:stepNumber-1] forKey:@"totalSteps"];
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
  if (self.delegate != nil && [self.delegate respondsToSelector:@selector(videoParser:didParse:)]) {
    [self.delegate videoParser:self didParse:video];
  }
}

- (void)parseError:(NSError *)error {
  if (self.delegate != nil && [self.delegate respondsToSelector:@selector(videoParser:didFailWithError:)]) {
    [self.delegate videoParser:self didFailWithError:error];
  }
}

- (void)cancel {
  [conn cancel];
}

@end
