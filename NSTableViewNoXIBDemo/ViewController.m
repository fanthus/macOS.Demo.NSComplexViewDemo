//
//  ViewController.m
//  NSTableViewNoXibDemo
//
//  Created by Fan's iMac  on 12/3/17.
//  Copyright © 2017 FanFrank. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSTableViewDelegate,NSTableViewDataSource> {
    NSScrollView *scrollView;
    NSTableView *tableView;
    NSMutableArray *mFirColumnArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareForArray];

    scrollView = [[NSScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.wantsLayer = YES;
    scrollView.layer.backgroundColor = [NSColor systemRedColor].CGColor;

    tableView = [[NSTableView alloc] initWithFrame:scrollView.bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 100;
    tableView.autoresizingMask = NSViewWidthSizable|NSViewHeightSizable;
    tableView.allowsColumnResizing = YES;
    tableView.columnAutoresizingStyle = NSTableViewUniformColumnAutoresizingStyle;

    NSTableColumn *tableColumn = [[NSTableColumn alloc] initWithIdentifier:@"FirstColumn"];
    [tableView addTableColumn:tableColumn];

    [scrollView setDocumentView:tableView];

    [self.view addSubview:scrollView];
}


- (void)prepareForArray {
    mFirColumnArray = [[NSMutableArray alloc] initWithCapacity:0];
    [mFirColumnArray addObject:@"One"];
    [mFirColumnArray addObject:@"Two"];
    [mFirColumnArray addObject:@"Three"];

}

#pragma mark - NSTableViewDataSource Methods

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return mFirColumnArray.count;
}

#pragma mark - NSTableViewDelegate Methods

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSTextField *result = [tableView makeViewWithIdentifier:@"MyView" owner:self];
    // There is no existing cell to reuse so create a new one
    if (result == nil) {
        // Create the new NSTextField with a frame of the {0,0} with the width of the table.
        // Note that the height of the frame is not really relevant, because the row height will modify the height.
        result = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, tableView.frame.size.width, 50)];
        // The identifier of the NSTextField instance is set to MyView.
        // This allows the cell to be reused.
        result.identifier = @"MyView";
    }
    // result is now guaranteed to be valid, either as a reused cell
    // or as a new cell, so set the stringValue of the cell to the
    // nameArray value at row
    result.stringValue = [mFirColumnArray objectAtIndex:row];
    // Return the result
    return result;
}



- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    // Update the view, if already loaded.
}


@end
