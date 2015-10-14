//
//  SGAppDelegate.m
//  SGConfGCDDemo
//
//  Created by Ben Asher on 10/13/15.
//

#import "SGAppDelegate.h"

#import "SGCatsViewController.h"
#import "SGAnimationQueueViewController.h"

@interface SGAppDelegate ()

@end

@implementation SGAppDelegate

@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  // Setup a tab bar view controller
  UITabBarController *tabBarController = [[UITabBarController alloc] init];
  tabBarController.viewControllers = @[[[SGCatsViewController alloc] init],
                                       [[SGAnimationQueueViewController alloc] init],
                                       ];
  // Setup the tab bar items
  tabBarController.viewControllers.firstObject.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Cats" image:nil tag:0];
  tabBarController.viewControllers.lastObject.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Animations" image:nil tag:0];
  
  // Setup the window with the tab bar view controllers
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  self.window.rootViewController = tabBarController;
  [self.window makeKeyAndVisible];
  
  return YES;
}

@end
