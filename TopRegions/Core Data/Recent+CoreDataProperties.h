//
//  Recent+CoreDataProperties.h
//  TopRegions
//
//  Created by Sam Fisher on 11/5/15.
//  Copyright © 2015 Sam Fisher Apps. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Recent.h"

NS_ASSUME_NONNULL_BEGIN

@interface Recent (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *lastViewed;
@property (nullable, nonatomic, retain) Photo *photo;

@end

NS_ASSUME_NONNULL_END
