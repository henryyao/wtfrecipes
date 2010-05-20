//
//  RecipeViewController.h
//  wtfrecipes
//
//  Created by Henry Yao on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Video.h"
#import "VideoParser.h"
#import "VideosParser.h"
#import "RecipeDetailViewController.h"

@interface RecipeViewController : UIViewController <VideosParserDelegate, VideoParserDelegate> {
  UILabel *food;
  Video *currentVideo;
  NSMutableArray *videos;
  VideoParser *videoParser;
  VideosParser *videosParser;
  RecipeDetailViewController *detailViewController;
  UIToolbar *toolbar;
  UIView *loadingView;
  UIButton *ohSweetButton;
  int page;
}

@property (nonatomic, retain) IBOutlet UILabel *food;
@property (nonatomic, retain) Video *currentVideo;
@property (nonatomic, retain) NSMutableArray *videos;
@property (nonatomic, retain) VideoParser *videoParser;
@property (nonatomic, retain) VideosParser *videosParser;
@property (nonatomic, retain) IBOutlet RecipeDetailViewController *detailViewController;
@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;
@property (nonatomic, retain) IBOutlet UIView *loadingView;
@property (nonatomic, retain) IBOutlet UIButton *ohSweetButton;
@property (nonatomic) int page;

- (IBAction)ohSweet:(id)sender;
- (IBAction)fuckThat:(id)sender;

- (void)loadMoar;
- (void)setNextFood;
- (void)showDetails;
- (void)presentDetailViewController;

@end
