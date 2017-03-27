//
//  AppDelegate.m
//  TableViewFoldDemo
//
//  Created by 菅思博 on 2017/3/27.
//  Copyright © 2017年 菅思博. All rights reserved.
//

#import "AppDelegate.h"

#import "ContactsViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
#pragma mark 生命周期
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    _window.backgroundColor = [UIColor js_colorWithHexString:@"#FFFFFF"];
    
    ContactsViewController *viewController = [[ContactsViewController alloc] init];
    
    _window.rootViewController = viewController;
    
    [_window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {

}

@end
