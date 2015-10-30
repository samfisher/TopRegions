//
//  PhotosTableViewController.m
//  Top Places
//
//  Created by Sam Fisher on 10/22/15.
//  Copyright © 2015 Sam Fisher Apps. All rights reserved.
//

#import "PhotosTableViewController.h"
#import "ImageViewController.h"
#import "RecentPhotos.h"

@interface PhotosTableViewController ()

@end

@implementation PhotosTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Properties
- (void)setPhotos:(NSArray *)photos
{
    _photos = photos;
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // TODO: Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.photos count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PhotoCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                                            forIndexPath:indexPath];
    
    NSDictionary *photo = self.photos[indexPath.row];
    cell.textLabel.text = [FlickrHelper titleOfPhoto:photo];
    cell.detailTextLabel.text = [FlickrHelper subtitleOfPhoto:photo];
    
    return cell;
}

- (void)prepareImageViewController:(ImageViewController *)vc
              forPhoto:(NSDictionary *)photo
{
    vc.imageURL = [FlickrHelper URLforPhoto:photo];
    vc.title = [FlickrHelper titleOfPhoto:photo];
    [RecentPhotos addPhoto:photo];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    if ([segue.identifier isEqualToString:@"ShowPhoto"] && indexPath)
    {
        [self prepareImageViewController:segue.destinationViewController
                    forPhoto:self.photos[indexPath.row]];
    }
}

@end
