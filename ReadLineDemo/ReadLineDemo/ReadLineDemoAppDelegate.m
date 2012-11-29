//
//  ReadLineDemoAppDelegate.m
//  ReadLineDemo
//
//  Created by Ethan Horger on 11/27/12.
//  Copyright (c) 2012 Ethan Horger. All rights reserved.
//

#import "ReadLineDemoAppDelegate.h"
#import "NSFileHandle+readLine.h"

@implementation ReadLineDemoAppDelegate

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    linesFound = [[NSMutableArray alloc] init];
    
    // Open our demo file
    
    NSString *demoFilePath = [[NSBundle mainBundle] pathForResource:@"SampleFile" ofType:@"txt"];
    NSFileHandle *demoFileHandle = [NSFileHandle fileHandleForReadingAtPath:demoFilePath];
    
    // Use readLineWithDelimiter to fill our NSTableView with each line found
    
    NSData *lineData;
    
    while ((lineData = [demoFileHandle readLineWithDelimiter:@"\n"]))
    {        
        NSString *lineString = [[NSString alloc] initWithData:lineData encoding:NSASCIIStringEncoding];
        
        [linesFound addObject:lineString];
        
        [lineString release];
    }
    
    [[self linesFoundView] reloadData];
}

/**
 * NSTableViewDataSource Protocol Methods
 */

- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
    return [linesFound count];
}

- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    if ([[tableColumn identifier] isEqualToString:@"Number"])
    {
        return [NSString stringWithFormat:@"%ld", row];
    }
    else if ([[tableColumn identifier] isEqualToString:@"LineText"])
    {
        return [linesFound objectAtIndex:row];
    }
    
    return nil;
}

- (void)tableView:(NSTableView *)aTableView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    [linesFound insertObject:object atIndex:row];
}

@end
