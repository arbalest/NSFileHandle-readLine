//
//  ReadLineDemoAppDelegate.h
//  ReadLineDemo
//
//  Created by Ethan Horger on 11/27/12.
//  Copyright (c) 2012 Ethan Horger. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ReadLineDemoAppDelegate : NSObject <NSApplicationDelegate>
{
    NSMutableArray *linesFound;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTableView *linesFoundView;

@end
