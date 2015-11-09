//
//  Region+Create.m
//  TopRegions
//
//  Created by Sam Fisher on 11/5/15.
//  Copyright © 2015 Sam Fisher Apps. All rights reserved.
//

#import "Region+Create.h"
#import "Photographer+CoreDataProperties.h"


@implementation Region (Create)

+ (Region *)regionWithPlaceID:(NSString *)placeID
              andPhotographer:(Photographer *)photographer
       inManagedObjectContext:(NSManagedObjectContext *)context
{
    Region *region = nil;
    if ([placeID length])
    {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Region"];
        request.predicate = [NSPredicate predicateWithFormat:@"placeID = %@", placeID];
        NSError *error;
        NSArray *matches = [context executeFetchRequest:request error:&error];
        if (!matches || ([matches count] > 1))
        {
            // handle error
        }
        else if (![matches count])
        {
            region = [NSEntityDescription insertNewObjectForEntityForName:@"Region"
                                                   inManagedObjectContext:context];
            region.placeID = placeID;
            region.photoCount = @1;
            [region addPhotographersObject:photographer];
            region.photographerCount = @1;
            NSLog(@"%@", region.placeID);
        }
        else
        {
            region = [matches lastObject];
            region.photoCount = @([region.photoCount intValue] + 1);
            
            //if (![region.photographers member:photographer])
            //{
                [region addPhotographersObject:photographer];
                region.photographerCount = @([region.photographerCount intValue] + 1);
            //}
            NSLog(@"%@ already in database", region.placeID);
        }
    }
    
    return region;
}

@end
