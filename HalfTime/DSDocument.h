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
@property (retain) IBOutlet DSHalftonePrintView *halftoneView;

@end
