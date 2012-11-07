//
//  DDImageView.m
//  DDImageView
//
//  Created by David Ehlen on 07.11.12.
//  Copyright (c) 2012 David Ehlen. All rights reserved.
//

#import "DDImageView.h"

@implementation DDImageView


#if ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


-(void)awakeFromNib {
    startAnimation = NO;
    phase = 0.0f;
}

- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender {
    startAnimation = YES;
    if(timer != nil) {
        [timer invalidate];
    }
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.1
                                             target: self
                                           selector:@selector(tick:)
                                           userInfo: nil
                                            repeats: YES];

    [timer fire];
    [self setNeedsDisplay:YES];
    return NSDragOperationCopy;
}




- (void)draggingExited:(id <NSDraggingInfo>)sender
{
    startAnimation = NO;
    [timer invalidate];
    phase = 0.0f;
    [self setNeedsDisplay:YES];
}


- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender
{
	NSPasteboard *pboard = [sender draggingPasteboard];
	
    if ( [[pboard types] containsObject:NSFilenamesPboardType] ) {
    }
	
	
    NSPasteboard *paste = [sender draggingPasteboard];
    NSArray *types = [NSArray arrayWithObjects:NSTIFFPboardType,
					  NSFilenamesPboardType, nil];
    NSString *desiredType = [paste availableTypeFromArray:types];
    NSData *carriedData = [paste dataForType:desiredType];
	
    if (nil == carriedData)
    {
        NSRunAlertPanel(@"Drag & Drop Error", @"Sorry, but the last operation failed",
						nil, nil, nil);
        return NO;
    }
    else
    {
        if ([desiredType isEqualToString:NSTIFFPboardType])
        {
			NSImage *newImage = [[NSImage alloc] initWithData:carriedData];
			[self setImage:newImage];
        }
        else if ([desiredType isEqualToString:NSFilenamesPboardType])
        {
            NSArray *fileArray =
			[paste propertyListForType:@"NSFilenamesPboardType"];

            NSString *path = [fileArray objectAtIndex:0];
            NSImage *newImage = [[NSImage alloc] initWithContentsOfFile:path];
			
            if (nil == newImage)
            {
                NSRunAlertPanel(@"File not Supported",
								[NSString stringWithFormat:
								 @"Sorry, but the file at \"%@\" failed to open",
								 path], nil, nil, nil);
                return NO;
            }
            else
            {
				[self setImage:newImage];
            }
        }
        else
        {
            
            return NO;
        }
    }
    [self setNeedsDisplay:YES];
    return YES;
}

- (void)tick:(NSTimer *)theTimer
{
    phase += 8.0f;
    [self setNeedsDisplay:YES];
}


-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    if (!self.image) {
        [[NSColor colorWithCalibratedRed:0.65f green:0.65f blue:0.65f alpha:1.00f] set];

        if(startAnimation) {
            [[NSColor colorWithCalibratedWhite:0.167 alpha:1.000] set];
        }
        
        NSBezierPath *roundPath = [NSBezierPath bezierPathWithRoundedRect:rect xRadius:30.0f yRadius:30.0f];
        [roundPath addClip];
        [roundPath closePath];
        
        
        CGFloat pattern[2] = {25.0f, 25.0f};

        NSBezierPath *framePath = [NSBezierPath bezierPathWithRoundedRect:rect xRadius:30.0f yRadius:30.0f];
        [framePath setLineWidth:13.0f];
        [framePath setLineDash:pattern count:2 phase:phase];
        [framePath stroke];
        [framePath closePath];
        
        [@"Drop Image Here" drawAtPoint:NSMakePoint((rect.size.width/2.0f-80.0f), (rect.size.height / 2.0f-15.0f)) withAttributes:@{ NSForegroundColorAttributeName : [NSColor colorWithCalibratedRed:0.65f green:0.65f blue:0.65f alpha:1.00f], NSFontAttributeName : [NSFont systemFontOfSize:20.0f] }];
         
       
        
    }
}


@end

