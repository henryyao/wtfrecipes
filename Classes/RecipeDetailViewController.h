//
//  RecipeDetailViewController.h
//  wtfrecipes
//
//  Created by Henry Yao on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Video.h"


@interface RecipeDetailViewController : UITableViewController {
  Video *video;
}

@property (nonatomic, retain) Video *video;

@end
