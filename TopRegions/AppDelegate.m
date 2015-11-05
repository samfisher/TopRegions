//
//  AppDelegate.m
//  Top Places
//
//  Created by Sam Fisher on 10/20/15.
//  Copyright © 2015 Sam Fisher Apps. All rights reserved.
//

#import "AppDelegate.h"
#import "FlickrHelper.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

#define FOREGROUND_FLICKR_FETCH_INTERVAL (15 * 60)

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self startFlickrFetch];
    [NSTimer scheduledTimerWithTimeInterval:FOREGROUND_FLICKR_FETCH_INTERVAL
                                     target:self
                                   selector:@selector(startFlickrFetch:)
                                   userInfo:nil
                                    repeats:YES];
    return YES;
}

- (void)startFlickrFetch
{
    [FlickrHelper startBackgroundDownloadRecentPhotosOnCompletion:^(NSArray *photos, void (^whenDone)()) {
        NSLog(@"%d photos fetched", [photos count]);
        if (whenDone) whenDone();
    }];
}

- (void)application:(UIApplication *)application handleEventsForBackgroundURLSession:(NSString *)identifier completionHandler:(void (^)())completionHandler
{
    [FlickrHelper handleEventsForBackgroundURLSession:identifier
                                    completionHandler:completionHandler];
}

- (void)startFlickrFetch:(NSTimer *)timer
{
    [self startFlickrFetch];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end
