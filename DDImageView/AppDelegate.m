//
//  AppDelegate.m
//  DDImageView
//
//  Created by David Ehlen on 07.11.12.
//  Copyright (c) 2012 David Ehlen. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [imageView setControlText:@"Drop image here"];
    [imageView setAnimationDuration:.1f];
    [imageView setNeedsDisplay:YES];
}

-(IBAction)clear:(id)sender {
    imageView.image = nil;
    [imageView cancelAnimation];
}

@end
