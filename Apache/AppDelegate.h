//
//  AppDelegate.h
//  Apache
//
//  Created by Vova Zolotoy on 12/4/13.
//  Copyright (c) 2013 Vova Zolotoy. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    IBOutlet NSMenu * menu;
    NSStatusItem * item;
}

@property (assign) IBOutlet NSWindow *window;

@end
