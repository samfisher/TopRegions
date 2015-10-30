//
//  RecentPhotos.h
//  Top Places
//
//  Created by Sam Fisher on 10/27/15.
//  Copyright © 2015 Sam Fisher Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecentPhotos : NSObject

+ (NSArray *)allPhotos;
+ (void)addPhoto:(NSDictionary *)photo;

@end
