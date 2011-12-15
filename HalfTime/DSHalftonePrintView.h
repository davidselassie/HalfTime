//
//  DSHalftonePrintView.h
//  HalfTime
//
//  Created by David Selassie on 11/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface DSHalftonePrintView : NSImageView

@property (retain) NSBitmapImageRep *pixelatedImageRep;
@property (readonly) NSInteger pagesHigh;
@property (readonly) NSInteger pagesWide;
@property (assign) NSSize paperSize;
@property (readwrite) NSRect pageBounds;
@property (assign) CGFloat dotSize;
@property (assign) CGFloat zoom;
@property (retain) NSDictionary *labelAttributes;

@end

NSSize NSFitSizeInSize(NSSize rect, NSSize size);
NSRect NSMakeZeroRectFromSize(NSSize size);
NSRect NSCenterRectInRect(NSRect frame, CGFloat radius);
