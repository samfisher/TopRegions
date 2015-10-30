//
//  PlacesTableViewController.h
//  Top Places
//
//  Created by Sam Fisher on 10/22/15.
//  Copyright © 2015 Sam Fisher Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrHelper.h"
#import "PlacePhotosTableViewController.h"

@interface PlacesTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *places;

@end
