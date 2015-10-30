//
//  RecentPhotosTableViewController.m
//  Top Places
//
//  Created by Sam Fisher on 10/27/15.
//  Copyright © 2015 Sam Fisher Apps. All rights reserved.
//

#import "RecentPhotosTableViewController.h"
#import "RecentPhotos.h"

@interface RecentPhotosTableViewController ()

@end

@implementation RecentPhotosTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.photos = [RecentPhotos allPhotos];
}

@end
