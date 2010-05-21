//
//  MarkerCell.m
//  wtfrecipes
//
//  Created by Henry Yao on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MarkerCell.h"


@implementation MarkerCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
  if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
    // Initialization code
  }
  return self;
}


- (void)layoutSubviews {
  [super layoutSubviews];
  self.textLabel.backgroundColor = [UIColor clearColor];
  self.detailTextLabel.backgroundColor = [UIColor clearColor];
  self.detailTextLabel.numberOfLines = 0;
  self.detailTextLabel.font = [UIFont systemFontOfSize:15.0];
  self.detailTextLabel.lineBreakMode = UILineBreakModeWordWrap;
  CGSize s = [self.detailTextLabel.text sizeWithFont:self.detailTextLabel.font
                                   constrainedToSize:CGSizeMake(self.detailTextLabel.frame.size.width, MAXFLOAT)
                                       lineBreakMode:UILineBreakModeWordWrap];
  self.detailTextLabel.frame = CGRectMake(self.detailTextLabel.frame.origin.x,
                                          self.detailTextLabel.frame.origin.y,
                                          self.detailTextLabel.frame.size.width,
                                          s.height);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];
  
  // Configure the view for the selected state
}


- (void)dealloc {
  [super dealloc];
}


@end
