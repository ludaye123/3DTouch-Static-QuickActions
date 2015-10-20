//
//  AppDelegate.m
//  3DTouchDemo
//
//  Created by LS on 10/19/15.
//  Copyright © 2015 LS. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIApplicationShortcutItem *shortcutItem = [launchOptions objectForKeyedSubscript:UIApplicationLaunchOptionsShortcutItemKey];
    
    if(shortcutItem)
    {
        [self quickActionWithShortcutItem:shortcutItem];
    }
    
    return YES;
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    [self quickActionWithShortcutItem:shortcutItem];
    completionHandler(YES);
}


- (void)quickActionWithShortcutItem:(UIApplicationShortcutItem *)shortcutItem
{
    NSLog(@"%@  %@",shortcutItem.type,shortcutItem.userInfo);
}

@end
