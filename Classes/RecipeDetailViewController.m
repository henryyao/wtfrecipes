//
//  RecipeDetailViewController.m
//  wtfrecipes
//
//  Created by Henry Yao on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RecipeDetailViewController.h"
#import "Marker.h"
#import "MarkerCell.h"


@implementation RecipeDetailViewController

@synthesize video;

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
  
  // Uncomment the following line to preserve selection between presentations.
  //self.clearsSelectionOnViewWillAppear = NO;
  
  // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
  // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  // Return the number of rows in the section.
  //return 1;
  if(section==0) return [video.ingredients count];
  else if(section==1) return [video.markers count];
  else return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  if(section==0) return @"You Will Need";
  else if(section==1) return @"Steps";
  else return nil;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier;
  UITableViewCell *cell;
  
  if(indexPath.section==0) {
    CellIdentifier = @"IngredientCell";  
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
      cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    cell.textLabel.text = [video.ingredients objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor colorWithRed:0.35 green:0.20 blue:0.12 alpha:1.0];
    cell.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.93 alpha:1.0];
  }
  else {
    CellIdentifier = @"MarkerCell";  
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
      cell = [[[MarkerCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    Marker *m = (Marker *)[video.markers objectAtIndex:indexPath.row];
    if([m.markerType isEqualToString:@"Warning"])
      cell.backgroundColor = [UIColor colorWithRed:1.0 green:0.8 blue:0.81 alpha:1.0];
    else if([m.markerType isEqualToString:@"Tip"])
      cell.backgroundColor = [UIColor colorWithRed:0.88 green:1.0 blue:0.94 alpha:1.0];
    else if([m.markerType isEqualToString:@"Fact"])
      cell.backgroundColor = [UIColor colorWithRed:0.9 green:0.95 blue:1.0 alpha:1.0];
    else
      cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.text = [m isaStep] ? (m.markerTitle!=nil) ? [NSString stringWithFormat:@"%i. %@", m.stepNumber, m.markerTitle] : [NSString stringWithFormat:@"Step %i", m.stepNumber] : m.markerTitle;
    cell.detailTextLabel.text = m.markerText;
  }
    
  return cell;
}


//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//  return YES;
//}


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  if(indexPath.section==1) {
    CGSize s = [((Marker *)[video.markers objectAtIndex:indexPath.row]).markerText sizeWithFont:[UIFont systemFontOfSize:15.0]
                                                                             constrainedToSize:CGSizeMake(tableView.frame.size.width-40, MAXFLOAT)];
    return 44.0+s.height;
  }
  else return 44.0;
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
  // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
  // For example: self.myOutlet = nil;
}


- (void)dealloc {
  [super dealloc];
}


@end

