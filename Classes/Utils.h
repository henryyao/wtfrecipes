//
//  Utils.h
//  wtfrecipes
//
//  Created by Henry Yao on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TouchXML.h"


@interface Utils : NSObject {
  
}

+ (NSString *)flattenHTML:(NSString *)html;
+ (NSString *)stringValueFromElement:(CXMLElement *)element named:(NSString *)name;
+ (NSNumber *)numberValueFromElement:(CXMLElement *)element named:(NSString *)name;

@end
