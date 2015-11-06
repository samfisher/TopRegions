//
//  Region.h
//  TopRegions
//
//  Created by Sam Fisher on 11/5/15.
//  Copyright © 2015 Sam Fisher Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Photo, Photographer;

NS_ASSUME_NONNULL_BEGIN

@interface Region : NSManagedObject

- (void)addPhotosObject:(Photo *)value;
- (void)removePhotosObject:(Photo *)value;
- (void)addPhotos:(NSSet *)values;
- (void)removePhotos:(NSSet *)values;

- (void)addPhotographersObject:(Photographer *)value;
- (void)removePhotographersObject:(Photographer *)value;
- (void)addPhotographers:(NSSet *)values;
- (void)removePhotographers:(NSSet *)values;


@end

NS_ASSUME_NONNULL_END

#import "Region+CoreDataProperties.h"
