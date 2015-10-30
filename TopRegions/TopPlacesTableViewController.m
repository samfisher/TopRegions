//
//  TopPlacesTableViewController.m
//  Top Places
//
//  Created by Sam Fisher on 10/22/15.
//  Copyright © 2015 Sam Fisher Apps. All rights reserved.
//

#import "TopPlacesTableViewController.h"

@interface TopPlacesTableViewController ()

@end

@implementation TopPlacesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self fetchPlaces];
}

- (IBAction)fetchPlaces
{
    [self.refreshControl beginRefreshing];
    [self.tableView setContentOffset:CGPointMake(0, -self.refreshControl.frame.size.height) animated:YES];
    
    [FlickrHelper loadTopPlacesOnCompletion:^(NSArray *places, NSError *error) {
        if (!error)
        {
            self.places = places;
            [self.refreshControl endRefreshing];
        } else {
            NSLog(@"Error loading TopPlaces: %@", error);
        }
    }];
}

@end
