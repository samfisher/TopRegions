//
//  FlickrHelper.h
//  Top Places
//
//  Created by Sam Fisher on 10/21/15.
//  Copyright © 2015 Sam Fisher Apps. All rights reserved.
//

#import "FlickrFetcher.h"

@interface FlickrHelper : FlickrFetcher

+ (void)loadTopPlacesOnCompletion:(void (^)(NSArray *photos, NSError *error))completionHandler;
+ (void)loadPhotosInPlace:(NSDictionary *)place
               maxResults:(NSUInteger)results
             onCompletion:(void (^)(NSArray *photos, NSError *error))completionHandler;

+ (NSString *)countryOfPlace:(NSDictionary *)place;
+ (NSString *)titleOfPlace:(NSDictionary *)place;
+ (NSString *)subtitleOfPlace:(NSDictionary *)place;
+ (NSArray *)sortPlaces:(NSArray *)places;
+ (NSDictionary *)placesByCountries:(NSArray *)places;
+ (NSArray *)countriesFromPlacesByCountry:(NSDictionary *)placesByCountry;


+ (NSString *)titleOfPhoto:(NSDictionary *)photo;
+ (NSString *)subtitleOfPhoto:(NSDictionary *)photo;

+ (NSURL *)URLforPhoto:(NSDictionary *)photo;

+ (NSString *)IDforPhoto:(NSDictionary *)photo;

+ (void)loadRecentPhotosOnCompletion:(void (^)(NSArray *places, NSError *error))completionHandler;

+ (void)startBackgroundDownloadRecentPhotosOnCompletion:(void (^)(NSArray *photos, void(^whenDone)()))completionHandler;
+ (void)handleEventsForBackgroundURLSession:(NSString *)identifier
                          completionHandler:(void (^)())completionHandler;


+ (NSURL *)URLforThumbnail:(NSDictionary *)photo;
+ (NSString *)ownerOfPhoto:(NSDictionary *)photo;
+ (NSString *)placeIDforPhoto:(NSDictionary *)photo;
@end
