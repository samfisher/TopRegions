//
//  Photographer+Create.h
//  TopRegions
//
//  Created by Sam Fisher on 11/5/15.
//  Copyright © 2015 Sam Fisher Apps. All rights reserved.
//

#import "Photographer.h"

@interface Photographer (Create)

+ (Photographer *)photographerWithName:(NSString *)name
                inManagedObjectContext:(NSManagedObjectContext *)context;

@end
