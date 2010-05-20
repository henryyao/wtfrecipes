//
//  PlaybackToolbarNavigationController.h
//  Howcast
//
//  Created by Henry Yao on 5/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ToolbarNavigationController : UINavigationController {
  UIBarButtonItem *closeButton;
}

@property (nonatomic, retain) UIBarButtonItem *closeButton;

@end
