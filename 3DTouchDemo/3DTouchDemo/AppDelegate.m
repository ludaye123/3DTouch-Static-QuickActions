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
    
    [self setupApplicationShortcutItems];
    
    UIApplicationShortcutItem *shortcutItem = [launchOptions objectForKeyedSubscript:UIApplicationLaunchOptionsShortcutItemKey];
    
    if(shortcutItem)
    {
        [self quickActionWithShortcutItem:shortcutItem];
    }
    
    return YES;
}

- (void)setupApplicationShortcutItems
{
    UIApplicationShortcutIcon *homeIcon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCompose];
    UIApplicationShortcutIcon *messageIcon = [UIApplicationShortcutIcon iconWithTemplateImageName:@"message"];
    
    NSDictionary *userInfo1 = @{@"key":@"home"};
    NSDictionary *userInfo2 = @{@"key":@"message"};
    
    
    UIMutableApplicationShortcutItem *homeShortcutItem = [[UIMutableApplicationShortcutItem alloc] initWithType:@"io.gitcafe.linfeng1009.main" localizedTitle:@"主页" localizedSubtitle:@"跳转主页" icon:homeIcon userInfo:userInfo1];
    UIMutableApplicationShortcutItem *messageShortcutItem = [[UIMutableApplicationShortcutItem alloc] initWithType:@"io.gitcafe.linfeng1009.message" localizedTitle:@"消息" localizedSubtitle:@"跳转消息" icon:messageIcon userInfo:userInfo2];
    
    NSArray *items = @[homeShortcutItem,messageShortcutItem];
    NSArray *exsitItems = [UIApplication sharedApplication].shortcutItems;
    NSArray *updateItems = [exsitItems arrayByAddingObjectsFromArray:items];
    
    [UIApplication sharedApplication].shortcutItems = updateItems;
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
