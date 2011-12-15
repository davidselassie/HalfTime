//
//  DSDocument.h
//  HalfTime
//
//  Created by David Selassie on 11/14/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "DSHalftonePrintView.h"

@interface DSDocument : NSDocument

@property (retain) NSImage *image;
@property (assign) CGFloat dotSize;
@property (assign) CGFloat zoom;
@property (assign) NSRect imageFrame;
@property (retain) IBOutlet DSHalftonePrintView *halftoneView;
@property (retain) IBOutlet NSWindow *halftoneWindow;

- (IBAction)decreaseDotSize:(id)sender;
- (IBAction)increaseDotSize:(id)sender;

- (IBAction)zoomOut:(id)sender;
- (IBAction)zoomIn:(id)sender;

@end
