//
//  DDImageView.h
//  DDImageView
//
//  Created by David Ehlen on 07.11.12.
//  Copyright (c) 2012 David Ehlen. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DDImageView : NSImageView {
BOOL startAnimation;
float phase;
NSTimer *timer;
}
@end
