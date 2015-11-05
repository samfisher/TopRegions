//
//  Photo+Flickr.m
//  TopRegions
//
//  Created by Sam Fisher on 11/5/15.
//  Copyright © 2015 Sam Fisher Apps. All rights reserved.
//

#import "Photo+Flickr.h"
#import "FlickrHelper.h"
#import "Photographer+Create.h"
#import "Region+Create.h"
//#import "Region+Flickr.h"

@implementation Photo (Flickr)


+ (void)loadPhotosFromFlickrArray:(NSArray *)photos // of Flickr NSDictionary
         intoManagedObjectContext:(NSManagedObjectContext *)context
{
    for (NSDictionary *photo in photos) {
        [self photoWithFlickrInfo:photo inManagedObjectContext:context];
    }
}

+ (Photo *)photoWithFlickrInfo:(NSDictionary *)photoDictionary
        inManagedObjectContext:(NSManagedObjectContext *)context
{
    Photo *photo = nil;
    NSString *unique = [FlickrHelper IDforPhoto:photoDictionary];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photo"];
    request.predicate = [NSPredicate predicateWithFormat:@"unique = %@", unique];
    NSError *error;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    if (!matches || error || ([matches count] > 1)) {
        // handle error
    } else if ([matches count]) {
        photo = [matches firstObject];
        NSLog(@"%@ already in database", photo.title);
    } else {
        photo = [NSEntityDescription insertNewObjectForEntityForName:@"Photo"
                                              inManagedObjectContext:context];
        photo.unique = unique;
        photo.title = [FlickrHelper titleOfPhoto:photoDictionary];
        photo.subtitle = [FlickrHelper subtitleOfPhoto:photoDictionary];
        photo.imageURL = [[FlickrHelper URLforPhoto:photoDictionary] absoluteString];
        photo.thumbnailURL = [[FlickrHelper URLforThumbnail:photoDictionary] absoluteString];
        
        photo.photographer = [Photographer photographerWithName:[FlickrHelper ownerOfPhoto:photoDictionary]
                                         inManagedObjectContext:context];
        
        photo.region = [Region regionWithPlaceID:[FlickrHelper placeIDforPhoto:photoDictionary]
                                 andPhotographer:photo.photographer
                          inManagedObjectContext:context];
        NSLog(@"%@", photo.title);
    }
    return photo;
}

@end
