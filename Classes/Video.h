//
//  Video.h
//  wtfrecipes
//
//  Created by Henry Yao on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Marker, Ingredient;

@interface Video : NSManagedObject 

@property (nonatomic, retain) NSString *videoTitle;
@property (nonatomic, retain) NSString *videoId;
@property (nonatomic, retain) NSSet *markers;
@property (nonatomic, retain) NSSet *ingredients;
@property (nonatomic) int totalSteps;
@property (nonatomic, retain) NSString *thumbnailURL;

@end

@interface Video (CoreDataGeneratedAccessors)
- (void)addMarkersObject:(Marker *)value;
- (void)removeMarkersObject:(Marker *)value;
- (void)addMarkers:(NSSet *)value;
- (void)removeMarkers:(NSSet *)value;

- (void)addIngredientsObject:(Ingredient *)value;
- (void)removeIngredientsObject:(Ingredient *)value;
- (void)addIngredients:(NSSet *)value;
- (void)removeIngredients:(NSSet *)value;
@end;
