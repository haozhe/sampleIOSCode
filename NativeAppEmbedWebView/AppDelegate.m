//
//  AppDelegate.m
//  NativeAppEmbedWebView
//
//  Created by Holly Schinsky on 11/6/12.
//  Copyright (c) 2012 Adobe. All rights reserved.
//

#import "AppDelegate.h"
#import "NewViewController.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    UIViewController *viewController = [[NewViewController alloc] initWithNibName:@"NewViewController" bundle:nil];
    UINavigationController *navigationViewController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    navigationViewController.navigationBarHidden = YES;
    navigationViewController.toolbarHidden = NO;
    [navigationViewController.toolbar setTintColor:[UIColor lightGrayColor]];
    
    UIImage *homeImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *home = [[UIBarButtonItem alloc]
                             initWithImage:homeImage
                             style:UIBarButtonItemStylePlain
                             target:viewController
                             action:@selector(showHomeWidget)];
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                      target:nil
                                      action:nil];
    UIBarButtonItem *refresh = [[UIBarButtonItem alloc]
                                initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                target:viewController
                                action:@selector(refreshCurrentWidget)];
    viewController.toolbarItems = [NSArray arrayWithObjects: home, flexibleSpace, refresh, nil];
    
    self.viewController = viewController;
    
    self.window.rootViewController = navigationViewController;
    [self.window makeKeyAndVisible];

    // Override point for customization after application launch.
    return YES;
}

- (AppDelegate*)getObjectPointer:(UIApplication *)application
{
    //return viewController;
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
