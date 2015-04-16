//
//  AppDelegate.h
//  DDImageView
//
//  Created by David Ehlen on 07.11.12.
//  Copyright (c) 2012 David Ehlen. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DDImageView.h"

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    IBOutlet DDImageView *imageView;
}

@property (assign) IBOutlet NSWindow *window;

-(IBAction)clear:(id)sender;

@end
