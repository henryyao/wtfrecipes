//
//  wtfrecipesAppDelegate.h
//  wtfrecipes
//
//  Created by Henry Yao on 5/20/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecipeViewController.h"

@interface wtfrecipesAppDelegate : NSObject <UIApplicationDelegate> {
  UIWindow *window;
  RecipeViewController *recipeViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RecipeViewController *recipeViewController;

@end

