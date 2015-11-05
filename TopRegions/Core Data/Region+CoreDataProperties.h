//
//  Region+CoreDataProperties.h
//  TopRegions
//
//  Created by Sam Fisher on 11/5/15.
//  Copyright © 2015 Sam Fisher Apps. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Region.h"

NS_ASSUME_NONNULL_BEGIN

@interface Region (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *photoCount;
@property (nullable, nonatomic, retain) NSNumber *photographerCount;
@property (nullable, nonatomic, retain) NSString *placeID;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) Photographer *photographers;
@property (nullable, nonatomic, retain) Photo *photos;

@end

NS_ASSUME_NONNULL_END
