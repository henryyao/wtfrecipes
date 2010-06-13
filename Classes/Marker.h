//
//  Marker.h
//  wtfrecipes
//
//  Created by Henry Yao on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Marker : NSManagedObject {
  NSString *markerType;
}

@property (nonatomic, retain) NSString *markerType;
@property (nonatomic, retain) NSString *markerTitle;
@property (nonatomic, retain) NSString *markerText;
@property (nonatomic, retain) NSString *thumbnailURL;
@property (nonatomic, retain) NSNumber *timemarker;
@property (nonatomic, retain) NSNumber *position;
@property (nonatomic) int stepNumber;

- (BOOL)isaStep;

@end
