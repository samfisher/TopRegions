//
//  Region+Create.h
//  TopRegions
//
//  Created by Sam Fisher on 11/5/15.
//  Copyright © 2015 Sam Fisher Apps. All rights reserved.
//

#import "Region.h"

@interface Region (Create)

+ (Region *)regionWithPlaceID:(NSString *)placeID
              andPhotographer:(Photographer *)photographer
       inManagedObjectContext:(NSManagedObjectContext *)context;

@end
