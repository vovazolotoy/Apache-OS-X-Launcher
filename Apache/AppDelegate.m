//
//  AppDelegate.m
//  Apache
//
//  Created by Vova Zolotoy on 12/4/13.
//  Copyright (c) 2013 Vova Zolotoy. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

// Initiation
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Create status bar item and bind it to menu
    item = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [item setMenu:menu];

    // Attach icon to status bar
    NSImage * icon = [NSImage imageNamed:@"Icon"];
    [item setImage:icon];
    [item setHighlightMode:YES];

    [self runProcessAsAdministrator:@"/usr/sbin/apachectl start"];
}

// Quit action
- (IBAction)quit:(id)sender
{
    [self runProcessAsAdministrator:@"/usr/sbin/apachectl stop"];
    [NSApp performSelector:@selector(terminate:) withObject:nil afterDelay:0.0];
}

// Executing method
- (BOOL) runProcessAsAdministrator:(NSString*)script
{
    // Generate apple script command
    script = [NSString stringWithFormat:@"do shell script \"%@\" with administrator privileges", script];
    NSAppleScript * appleScript = [[NSAppleScript new] initWithSource:script];
    NSDictionary * errors = [NSDictionary new];
    NSAppleEventDescriptor * result = [appleScript executeAndReturnError:&errors];
    
    // Check errors
    return (result ? YES : NO);
}

@end
