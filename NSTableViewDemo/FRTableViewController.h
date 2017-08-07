//
//  FRTableViewController.h
//  NSTableViewDemo
//
//  Created by Fan's iMac  on 2017/8/7.
//  Copyright © 2017年 FanFrank. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FRTableViewController : NSViewController

@property (weak) IBOutlet NSTableView *tableView;
@property (weak) IBOutlet NSButton *addRow;
@property (weak) IBOutlet NSButton *delRow;

@property (weak) IBOutlet NSTextField *nameTF;
@property (weak) IBOutlet NSTextField *addrTF;
@property (weak) IBOutlet NSButton *cancelBtn;
@property (weak) IBOutlet NSButton *okBtn;
- (IBAction)cancelAdd:(id)sender;
- (IBAction)add:(id)sender;

- (IBAction)addRow:(id)sender;
- (IBAction)delRow:(id)sender;

@end
