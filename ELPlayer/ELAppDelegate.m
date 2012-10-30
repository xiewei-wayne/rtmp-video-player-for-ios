//
//  ELAppDelegate.m
//  ELPlayer
//
//  Created by Steven Jobs on 12-2-25.
//  Copyright (c) 2012年 www.ffsdk.com. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

#import <FFEngine/FFEngine.h>
#import "ELAppDelegate.h"

//#import "ELUtils.h"

#import "ELInputUrlViewController.h"

@implementation ELAppDelegate

@synthesize window = _window;
@synthesize mainViewController = _mainViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];

    NSLog(@"Bundle Path = %@", [NSBundle mainBundle].bundlePath);
    NSLog(@"Bundle ID = %@", [[NSBundle mainBundle] bundleIdentifier]);

    ELInputUrlViewController *mainViewController = [[[ELInputUrlViewController alloc] initWithNibName:@"ELInputUrlViewController" bundle:nil] autorelease];
    
    self.window.rootViewController = mainViewController;

    [self.window makeKeyAndVisible];

    registerLib("ffsdk.com");

    return YES;
}

@end
