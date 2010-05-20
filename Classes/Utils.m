//
//  Utils.m
//  wtfrecipes
//
//  Created by Henry Yao on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Utils.h"


@implementation Utils

// From http://rudis.net/content/2009/01/21/flatten-html-content-ie-strip-tags-cocoaobjective-c
+ (NSString *)flattenHTML:(NSString *)html {
  
  NSScanner *theScanner;
  NSString *text = nil;
  
  theScanner = [NSScanner scannerWithString:html];
  
  while ([theScanner isAtEnd] == NO) {
    
    // find start of tag
    [theScanner scanUpToString:@"<" intoString:NULL] ; 
    
    // find end of tag
    [theScanner scanUpToString:@">" intoString:&text] ;
    
    // replace the found tag with a space
    //(you can filter multi-spaces out later if you wish)
    html = [html stringByReplacingOccurrencesOfString:
            [ NSString stringWithFormat:@"%@>", text]
                                           withString:@" "];
    
  } // while //
  
  return html;
}

// Utility method to return string value from given CXMLElement
+ (NSString *)stringValueFromElement:(CXMLElement *)element named:(NSString *)name {
	NSArray *elements = [element elementsForName:name];
	if([elements count] > 0){
		return [[[elements objectAtIndex:0] stringValue] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	}
	else{
		return @"";
	}
}


// Utility method to return number value from given CXMLElement
+ (NSNumber *)numberValueFromElement:(CXMLElement *)element named:(NSString *)name {
	NSArray *elements = [element elementsForName:name];
	if([elements count] > 0){
		return [NSNumber numberWithInteger:[[[elements objectAtIndex:0] stringValue] integerValue]];
	}
	else{
		return nil;
	}
}




@end

