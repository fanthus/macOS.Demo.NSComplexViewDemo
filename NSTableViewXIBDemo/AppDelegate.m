//
//  AppDelegate.m
//  NSTableViewDemo
//
//  Created by Fan's iMac  on 2017/8/7.
//  Copyright © 2017年 FanFrank. All rights reserved.
//

#import "AppDelegate.h"
#import "FRTableViewController.h"

@interface AppDelegate () {
    //
}

@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    FRTableViewController *frtablevc = [[FRTableViewController alloc] initWithNibName:@"FRTableViewController" bundle:nil];
    self.window.contentViewController = frtablevc;
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
