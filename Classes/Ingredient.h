//
//  Ingredient.h
//  wtfrecipes
//
//  Created by Henry Yao on 5/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Ingredient : NSManagedObject

@property (nonatomic, retain) NSString *item;
@property (nonatomic, retain) NSNumber *displayOrder;

@end
