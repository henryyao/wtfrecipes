//
//  wtfrecipesAppDelegate.m
//  wtfrecipes
//
//  Created by Henry Yao on 5/20/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "wtfrecipesAppDelegate.h"

@implementation wtfrecipesAppDelegate

@synthesize window, recipeViewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
  
  // Override point for customization after application launch
	
  [window makeKeyAndVisible];
  [window addSubview:recipeViewController.view];
	
	return YES;
}


- (void)dealloc {
  [recipeViewController release];
  [window release];
  [super dealloc];
}


@end
