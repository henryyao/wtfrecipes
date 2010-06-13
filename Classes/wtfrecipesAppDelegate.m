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
  recipeViewController.managedObjectContext = self.managedObjectContext;
	
  [window makeKeyAndVisible];
  [window addSubview:recipeViewController.view];
	
	return YES;
}


- (void)dealloc {
  [recipeViewController release];
  [managedObjectContext release];
  [persistentStoreCoordinator release];
  [persistentStorePath release];
  [window release];
  [super dealloc];
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
  if (persistentStoreCoordinator == nil) {
    NSURL *storeUrl = [NSURL fileURLWithPath:self.persistentStorePath];
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[NSManagedObjectModel mergedModelFromBundles:nil]];
    NSError *error = nil;
    NSPersistentStore *persistentStore = [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error];
    NSAssert3(persistentStore != nil, @"Unhandled error adding persistent store in %s at line %d: %@", __FUNCTION__, __LINE__, [error localizedDescription]);
  }
  return persistentStoreCoordinator;
}

- (NSManagedObjectContext *)managedObjectContext {
  if (managedObjectContext == nil) {
    managedObjectContext = [[NSManagedObjectContext alloc] init];
    [managedObjectContext setPersistentStoreCoordinator:self.persistentStoreCoordinator];
  }
  return managedObjectContext;
}

- (NSString *)persistentStorePath {
  if (persistentStorePath == nil) {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths lastObject];
    persistentStorePath = [[documentsDirectory stringByAppendingPathComponent:@"TopSongs.sqlite"] retain];
  }
  return persistentStorePath;
}


@end
