//
//  ViciDocument.m
//  Vici
//
//  Created by Dave DeLong on 10/9/09.
//  Copyright Home 2009 . All rights reserved.
//

#import "ViciDocument.h"

@implementation ViciDocument

- (id)init 
{
    self = [super init];
    if (self != nil) {
        // initialization code
    }
    return self;
}

- (NSString *)windowNibName 
{
    return @"ViciDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)windowController 
{
    [super windowControllerDidLoadNib:windowController];
    // user interface preparation code
}

@end
