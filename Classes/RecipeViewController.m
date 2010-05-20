//
//  RecipeViewController.m
//  wtfrecipes
//
//  Created by Henry Yao on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "RecipeViewController.h"
#import "Video.h"
#import "ToolbarNavigationController.h"


@implementation RecipeViewController
@synthesize food, currentVideo, videos, videoParser, videosParser, detailViewController, toolbar, loadingView, ohSweetButton, page;

- (void)viewDidLoad {
  CALayer *ohSweetButtonLayer = [self.ohSweetButton layer];
  ohSweetButtonLayer.masksToBounds = YES;
  ohSweetButtonLayer.cornerRadius = 8.0;
  ohSweetButtonLayer.borderWidth = 1.0;
  ohSweetButtonLayer.borderColor = [[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.1] CGColor];
  [super viewDidLoad];
  [self loadMoar];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

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


- (void)dealloc {
  [videos release];
  [videosParser release];
  [super dealloc];
}

#pragma mark RecipeViewController specific methods
- (void)loadMoar {
  [self.view bringSubviewToFront:loadingView];
  loadingView.hidden = NO;
  //page++;
  srandom(time(NULL));
  page = (int)((random()%25))+1;
  if(videoParser==nil) {
    self.videoParser = [[VideoParser alloc] init];
    videoParser.delegate = self;
  }
  if(videosParser==nil) {
    self.videosParser = [[VideosParser alloc] init];
    videosParser.delegate = self;
  }
  if(videos==nil) self.videos = [NSMutableArray array];
  [videosParser parseVideos:[NSURL URLWithString:[NSString stringWithFormat:@"http://api.howcast.com/videos/most_recent/howcast_studios/355-Category/%i.xml?api_key=dfabb48a725bd15902fa3058e1f46dcc967d7761", page]]];
}

- (void)setNextFood {
  if([videos count] > 0) {
    self.currentVideo = ((Video *)[videos objectAtIndex:0]);
    [videos removeObjectAtIndex:0];
    if(([self.currentVideo.videoTitle rangeOfString:@"Quick Tips"].location != 0) &&
       ([self.currentVideo.videoTitle rangeOfString:@"How Do You How"].location != 0))
      food.text = currentVideo.videoTitle;
    else
      [self setNextFood];
  }
  else [self loadMoar];
}

- (void)showDetails {
  detailViewController.video = currentVideo;
  detailViewController.title = currentVideo.videoTitle;
  if(([currentVideo.markers count]==0) || ([currentVideo.ingredients count]==0)) {
    [self.view bringSubviewToFront:toolbar];
    videoParser.video = currentVideo;
    loadingView.hidden = NO;
    [videoParser parseVideo:[NSURL URLWithString:[NSString stringWithFormat:@"http://api.howcast.com/videos/%@.xml", currentVideo.videoId]]];
  }
  else [self presentDetailViewController];
}

- (void)presentDetailViewController {
  ToolbarNavigationController *t = [[ToolbarNavigationController alloc] initWithRootViewController:detailViewController];
  [self presentModalViewController:t animated:YES];
  [t release];
}

#pragma mark IBAction methods
- (IBAction)ohSweet:(id)sender {
  [self showDetails];
}

- (IBAction)fuckThat:(id)sender {
  loadingView.hidden = YES;
  [videoParser cancel];
  [self setNextFood];
}


#pragma mark VideosParserDelegate methods
- (void)videosParser:(VideosParser *)parser didFailWithError:(NSError *)error {
  loadingView.hidden = YES;
  //FML
}

- (void)videosParser:(VideosParser *)parser didParse:(NSArray *)parsedVideos {
  [videos addObjectsFromArray:parsedVideos];
  [self setNextFood];
  loadingView.hidden = YES;
}

#pragma mark VideoParserDelegate methods
- (void)videoParser:(VideoParser *)parser didFailWithError:(NSError *)error {
  loadingView.hidden = YES;
  //FML
}

- (void)videoParser:(VideoParser *)parser didParse:(Video *)video {
  loadingView.hidden = YES;
  currentVideo = video;
  detailViewController.tableView.contentOffset = CGPointZero;
  [detailViewController.tableView reloadData];
  [self presentDetailViewController];
}


@end
