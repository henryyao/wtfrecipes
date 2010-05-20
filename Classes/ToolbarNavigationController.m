    //
//  PlaybackToolbarNavigationController.m
//  Howcast
//
//  Created by Henry Yao on 5/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ToolbarNavigationController.h"


@implementation ToolbarNavigationController

@synthesize closeButton;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

- (id)initWithRootViewController:(UIViewController *)rootViewController {
  if(self = [super initWithRootViewController:rootViewController]) {
    self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    self.closeButton = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStylePlain target:self action:@selector(onDone)];
    [self.navigationBar.topItem setLeftBarButtonItem:closeButton];
  }
  return self;
}

- (void)onDone {
  if(self.parentViewController != nil) {
    [self.parentViewController dismissModalViewControllerAnimated:YES];
  }
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [super viewDidLoad];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)release {
  //NSLog(@"ToolbarNavigationController release, retainCount = %i", [self retainCount]);
  [super release];
}

- (void)dealloc {
  [closeButton release];
  //NSLog(@"ToolbarNavigationController dealloc");
  [super dealloc];
}


@end
