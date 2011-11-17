//
//  DSDocument.m
//  Posterbate
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
    [self.halftoneView bind:@"paperSize" toObject:self withKeyPath:@"printInfo.paperSize" options:nil];
    
    [self.halftoneView bind:@"image" toObject:self withKeyPath:@"image" options:nil];
    [self bind:@"image" toObject:self.halftoneView withKeyPath:@"image" options:nil];
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    if ([typeName isEqualToString:@"PosterbateDocumentType"]) {
        return [NSKeyedArchiver archivedDataWithRootObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:[self.image TIFFRepresentationUsingCompression:NSTIFFCompressionPackBits factor:1], @"imageData", [NSNumber numberWithFloat:self.dotSize], @"dotSize", [NSNumber numberWithFloat:self.printInfo.paperSize.width], @"paperWidth", [NSNumber numberWithFloat:self.printInfo.paperSize.height], @"paperHeight", self.printInfo.paperName, @"paperName", nil]];
    }
    
    return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    if ([typeName isEqualToString:@"PosterbateDocumentType"]) {
        NSMutableDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        
        self.image = [[NSImage alloc] initWithData:[dict objectForKey:@"imageData"]];
        self.dotSize = [[dict objectForKey:@"dotSize"] floatValue];
        self.printInfo.paperSize = NSMakeSize([[dict objectForKey:@"paperWidth"] floatValue], [[dict objectForKey:@"paperWidth"] floatValue]);
        self.printInfo.paperName = [dict objectForKey:@"paperName"];
        
        return YES;
    }
    
    return NO;
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

- (BOOL)shouldChangePrintInfo:(NSPrintInfo *)newPrintInfo
{
    [self willChangeValueForKey:@"printInfo.paperSize"];
    BOOL val = [super shouldChangePrintInfo:newPrintInfo];
    [self didChangeValueForKey:@"printInfo.paperSize"];
    
    return val;
}

- (void)printDocument:(id)sender
{
    [halftoneView print:sender];
}

@end
