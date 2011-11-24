//
//  DSDocument.m
//  HalfTime
//
//  Created by David Selassie on 11/14/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DSDocument.h"

@implementation DSDocument

@synthesize image;
@synthesize dotSize;
@synthesize halftoneView;

- (id)init
{
    if (self = [super init]) {
        self.dotSize = 30.0;
        self.image = nil;
    }
    
    return self;
}

- (NSString *)windowNibName
{
    return @"DSDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];

    [self.halftoneView bind:@"dotSize" toObject:self withKeyPath:@"dotSize" options:nil];
    [self.halftoneView bind:@"pageBounds" toObject:self withKeyPath:@"printInfo.imageablePageBounds" options:nil];
    //[self.halftoneView bind:@"paperSize" toObject:self withKeyPath:@"printInfo.paperSize" options:nil];
    
    [self.halftoneView bind:@"image" toObject:self withKeyPath:@"image" options:nil];
    [self bind:@"image" toObject:self.halftoneView withKeyPath:@"image" options:nil];
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    if ([typeName isEqualToString:@"HalfTimeDocumentType"]) {
        return [NSKeyedArchiver archivedDataWithRootObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:[self.image TIFFRepresentationUsingCompression:NSTIFFCompressionLZW factor:1], @"imageData", [NSNumber numberWithFloat:self.dotSize], @"dotSize", [NSValue valueWithRect:self.printInfo.imageablePageBounds], @"paperPrintableRect", self.printInfo.paperName, @"paperName", [NSValue valueWithRect:self.windowForSheet.frame], @"windowFrame", [NSValue valueWithRect:self.halftoneView.bounds], @"halftoneBounds", nil]];
    }
    
    return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    if ([typeName isEqualToString:@"HalfTimeDocumentType"]) {
        NSMutableDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        
        self.dotSize = [[dict objectForKey:@"dotSize"] floatValue];
        self.printInfo.paperName = [dict objectForKey:@"paperName"];
        self.image = [[NSImage alloc] initWithData:[dict objectForKey:@"imageData"]];
        //[self.windowForSheet setFrame:[[dict objectForKey:@"windowFrame"] rectValue] display:YES animate:YES];
        [self.halftoneView setBounds:[[dict objectForKey:@"halftoneBounds"] rectValue]];
        
        return YES;
    }
    
    return NO;
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

/*- (BOOL)shouldChangePrintInfo:(NSPrintInfo *)newPrintInfo
{
    [self willChangeValueForKey:@"printInfo.paperSize"];
    BOOL val = [super shouldChangePrintInfo:newPrintInfo];
    [self didChangeValueForKey:@"printInfo.paperSize"];
    
    return val;
}*/

- (void)printDocument:(id)sender
{
    [halftoneView print:sender];
}

@end
