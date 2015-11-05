//
//  Photographer+CoreDataProperties.h
//  TopRegions
//
//  Created by Sam Fisher on 11/5/15.
//  Copyright © 2015 Sam Fisher Apps. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Photographer.h"

NS_ASSUME_NONNULL_BEGIN

@interface Photographer (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) Photo *photos;
@property (nullable, nonatomic, retain) Region *regions;

@end

NS_ASSUME_NONNULL_END
