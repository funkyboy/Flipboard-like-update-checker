//
//  SMAppDelegate.m
//  Updater
//
//  Created by cesarerocchi on 5/19/12.
//  Copyright (c) 2012 Studio Magnolia. All rights reserved.
//

#import "SMAppDelegate.h"
#import "SMViewController.h"
#import "SMUpdateNotifier.h"

@implementation SMAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.viewController = [[SMViewController alloc] initWithNibName:@"SMViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    SMUpdateNotifier *n = [[SMUpdateNotifier alloc] initWithDelegate:self];
    [n checkIfNewVersionExists];
    
    return YES;
}

- (void) newVersionExists:(NSString *)versionNumber {

    
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:APPNAME 
													message:[NSString 
															 stringWithFormat:@"A new version (%@) of %@ is available", 
															 versionNumber, APPNAME]
												   delegate:self 
										  cancelButtonTitle:@"Cancel" 
										  otherButtonTitles:@"Update", nil];
	
	[alert show];
    
}


- (void) thereIsNoNewVersion {

    NSLog(@"no new version available");
}

- (void) requestFailedwithError:(NSError *) error {

    NSLog(@"user is offline, or web service does not respond");
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
