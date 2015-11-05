//
//  Photographer+Create.m
//  TopRegions
//
//  Created by Sam Fisher on 11/5/15.
//  Copyright © 2015 Sam Fisher Apps. All rights reserved.
//

#import "Photographer+Create.h"

@implementation Photographer (Create)

+ (Photographer *)photographerWithName:(NSString *)name
                inManagedObjectContext:(NSManagedObjectContext *)context
{
    Photographer *photographer = nil;
    if ([name length]) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photographer"];
        request.predicate = [NSPredicate predicateWithFormat:@"name = %@", name];
        NSError *error;
        NSArray *matches = [context executeFetchRequest:request error:&error];
        if (!matches || ([matches count] > 1)) {
            // handle error
        } else if (![matches count]) {
            photographer = [NSEntityDescription insertNewObjectForEntityForName:@"Photographer"
                                                         inManagedObjectContext:context];
            photographer.name = name;
            NSLog(@"%@", photographer.name);
        } else {
            photographer = [matches lastObject];
            NSLog(@"%@ already in database", photographer.name);
        }
    }
    return photographer;
}


@end
