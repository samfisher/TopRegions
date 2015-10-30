//
//  PlacesTableViewController.m
//  Top Places
//
//  Created by Sam Fisher on 10/22/15.
//  Copyright © 2015 Sam Fisher Apps. All rights reserved.
//

#import "PlacesTableViewController.h"

@interface PlacesTableViewController ()

@property (nonatomic, strong) NSDictionary *placesByCountry;
@property (nonatomic, strong) NSArray *countries;

@end

@implementation PlacesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

#pragma mark - Properties

- (void)setPlaces:(NSArray *)places
{
    if (_places == places) return;
    _places = [FlickrHelper sortPlaces:places];
    self.placesByCountry = [FlickrHelper placesByCountries:_places];
    self.countries = [FlickrHelper countriesFromPlacesByCountry:self.placesByCountry];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.countries count];
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    return self.countries[section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.placesByCountry[self.countries[section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PlaceCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                                            forIndexPath:indexPath];
    NSDictionary *place = self.placesByCountry[self.countries[indexPath.section]][indexPath.row];
    cell.textLabel.text = [FlickrHelper titleOfPlace:place];
    cell.detailTextLabel.text = [FlickrHelper subtitleOfPlace:place];
    return cell;
}

- (void)preparePhotosTVC:(PlacePhotosTableViewController *)tvc
                forPlace:(NSDictionary *)place
{
    tvc.place = place;
    tvc.title = [FlickrHelper titleOfPlace:place];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    if ([segue.identifier isEqualToString:@"ShowPlace"] && indexPath)
    {
        [self preparePhotosTVC:segue.destinationViewController
                      forPlace:self.placesByCountry[self.countries[indexPath.section]][indexPath.row]];
    }
}


@end
