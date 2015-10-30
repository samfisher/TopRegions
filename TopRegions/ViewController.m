//
//  ViewController.m
//  Top Places
//
//  Created by Sam Fisher on 10/20/15.
//  Copyright © 2015 Sam Fisher Apps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [FlickrHelper loadTopPlacesOnCompletion:^(NSArray *photos, NSError *error)
    {
        NSLog(@"photos: %@\nerror: %@", photos, error);
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
