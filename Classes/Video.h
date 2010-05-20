//
//  Video.h
//  wtfrecipes
//
//  Created by Henry Yao on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Video : NSObject {
  NSString *videoTitle;
  NSString *videoId;
  NSMutableArray *markers;
  NSMutableArray *ingredients;
}

@property (nonatomic, retain) NSString *videoTitle;
@property (nonatomic, retain) NSString *videoId;
@property (nonatomic, retain) NSMutableArray *markers;
@property (nonatomic, retain) NSMutableArray *ingredients;

@end