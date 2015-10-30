//
//  PlacePhotosTableViewController.m
//  Top Places
//
//  Created by Sam Fisher on 10/22/15.
//  Copyright © 2015 Sam Fisher Apps. All rights reserved.
//

#import "PlacePhotosTableViewController.h"

@interface PlacePhotosTableViewController ()

@end

@implementation PlacePhotosTableViewController

#define MAX_PHOTO_RESULTS 50

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fetchPhotos];
}

- (IBAction)fetchPhotos
{
    [self.refreshControl beginRefreshing];
    [self.tableView setContentOffset:CGPointMake(0, -self.refreshControl.frame.size.height) animated:YES];
    
    [FlickrHelper loadPhotosInPlace:self.place
                         maxResults:MAX_PHOTO_RESULTS
                       onCompletion:^(NSArray *photos, NSError *error) {
                           if (!error)
                           {
                               self.photos = photos;
                               [self.refreshControl endRefreshing];
                           }
                           else
                           {
                               NSLog(@"Error loading Photos of %@: %@", self.place, error);
                           }
                       }];
}


@end
