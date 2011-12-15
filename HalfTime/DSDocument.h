//
//  DSDocument.h
//  HalfTime
//
//  Created by David Selassie on 11/14/11.
/*  Copyright (c) 2011 David Selassie. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 
 - Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 - Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

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
