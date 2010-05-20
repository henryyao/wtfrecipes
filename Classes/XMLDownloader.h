//
//  XMLDownloader.h
//  wtfrecipes
//
//  Created by Henry Yao on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface XMLDownloader : NSObject {
  NSMutableData *buffer;
  NSURLConnection *conn;
  BOOL done;  
}

@property (nonatomic, retain) NSMutableData *buffer;
@property (nonatomic, retain) NSURLConnection *conn;
@property (nonatomic) BOOL done;

- (void)downloadAndParse:(NSURL *)url;

@end
