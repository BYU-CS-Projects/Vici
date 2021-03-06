//
//  MyDocument.m
//  ViciMapEditor
//
//  Created by Robert Brown on 12/3/09.
//  Copyright 2009 BYU. All rights reserved.
//

#import "ViciMapDocument.h"
#import "ViciMapView.h"

@implementation ViciMapDocument

@synthesize territoryItem, scrollView, mapView;

- (id)init
{
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
        // If an error occurs here, send a [self release] message and return nil.
    
    }
    return self;
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"ViciMapEditorDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *) aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
	
	
	NSMenu * m = [[NSMenu alloc] init];
	NSMenuItem * addPlanet = [m addItemWithTitle:@"New Planet" action:@selector(addPlanet:) keyEquivalent:@""];
	[addPlanet setTarget:self];
	NSMenuItem * addContinent = [m addItemWithTitle:@"New Continent" action:@selector(addContinent:) keyEquivalent:@""];
	[addContinent setTarget:self];
	NSMenuItem * addCountry = [m addItemWithTitle:@"New Country" action:@selector(addCountry:) keyEquivalent:@""];
	[addCountry setTarget:self];
	
	[territoryItem setMenu:m];
	[m release];
	
	[mapView setFrame:[[scrollView contentView] frame]];
	[mapView setAutoresizingMask:
	 NSViewMinXMargin |
	 NSViewWidthSizable |
	 NSViewMaxXMargin |
	 NSViewMinYMargin |
	 NSViewHeightSizable |
	 NSViewMaxYMargin];
	[scrollView setDocumentView:mapView];
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to write your document to data of the specified type. If the given outError != NULL, ensure that you set *outError when returning nil.

    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.

    // For applications targeted for Panther or earlier systems, you should use the deprecated API -dataRepresentationOfType:. In this case you can also choose to override -fileWrapperRepresentationOfType: or -writeToFile:ofType: instead.

    if ( outError != NULL ) {
		*outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:NULL];
	}
	return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to read your document from the given data of the specified type.  If the given outError != NULL, ensure that you set *outError when returning NO.

    // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead. 
    
    // For applications targeted for Panther or earlier systems, you should use the deprecated API -loadDataRepresentation:ofType. In this case you can also choose to override -readFromFile:ofType: or -loadFileWrapperRepresentation:ofType: instead.
    
    if ( outError != NULL ) {
		*outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:NULL];
	}
    return YES;
}

@end
