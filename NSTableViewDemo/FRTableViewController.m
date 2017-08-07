//
//  FRTableViewController.m
//  NSTableViewDemo
//
//  Created by Fan's iMac  on 2017/8/7.
//  Copyright © 2017年 FanFrank. All rights reserved.
//

#import "FRTableViewController.h"
#import "FRPerson.h"

@interface FRTableViewController ()<NSTableViewDelegate,NSTableViewDataSource,NSMenuDelegate> {
    NSMutableArray *personArray;
    
}

@property (nonatomic,strong) NSPanel *panel;

@end

@implementation FRTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    personArray = [NSMutableArray arrayWithCapacity:0];
    FRPerson *person1 = [[FRPerson alloc] initWithName:@"Fan" andAddress:@"Shijiazhuang"];
    person1.personID = 1;
    FRPerson *person2 = [[FRPerson alloc] initWithName:@"Xu" andAddress:@"Xinjiang"];
    person2.personID = 2;
    [personArray addObject:person1];
    [personArray addObject:person2];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.doubleAction = @selector(doubleAction:);
    NSMenu *tableMenu = [[NSMenu alloc] initWithTitle:@"TableMenu"];
    tableMenu.delegate = self;
    NSMenuItem *testItem = [[NSMenuItem alloc] initWithTitle:@"Test" action:@selector(testMenuItem:) keyEquivalent:@""];
    [tableMenu addItem:testItem];
    
    self.tableView.menu = tableMenu;
    
    NSNib *nib = [[NSNib alloc] initWithNibNamed:@"FRAddRowPanel" bundle:nil];
    NSArray *topLevelObj = nil;
    if ([nib instantiateWithOwner:self topLevelObjects:&topLevelObj]) {
        for (NSView *subView in  topLevelObj) {
            if ([subView isKindOfClass:[NSPanel class]]) {
                self.panel = (NSPanel *)subView;
            }
        }
    }
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return personArray.count;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    FRPerson *person = [personArray objectAtIndex:row];
    if ([tableColumn.identifier isEqualToString:@"personID"]) {
        NSTableCellView *cellView = [tableView makeViewWithIdentifier:@"id_cell" owner:self];
        cellView.textField.stringValue = [NSString stringWithFormat:@"%ld",person.personID] ;
        return cellView;
    } else if ([tableColumn.identifier isEqualToString:@"name"]) {
        NSTableCellView *cellView = [tableView makeViewWithIdentifier:@"name_cell" owner:self];
        cellView.textField.stringValue = person.name;
        return cellView;
    } else if ([tableColumn.identifier isEqualToString:@"addr"]) {
        NSTableCellView *cellView = [tableView makeViewWithIdentifier:@"addr_cell" owner:self];
        cellView.textField.stringValue = person.addr;
        return cellView;
    } else if ([tableColumn.identifier isEqualToString:@"sex"]) {
        NSTableCellView *cellView = [tableView makeViewWithIdentifier:@"sex_cell" owner:self];
        NSPopUpButton *btn = (NSPopUpButton *)[cellView.subviews objectAtIndex:0];
        NSMenu *menu = [[NSMenu alloc] initWithTitle:@"FMenu"];
        NSMenuItem *boyMenuItem = [[NSMenuItem alloc] initWithTitle:@"Boy" action:@selector(chooseBoy:) keyEquivalent:@""];
        NSMenuItem *girlMenuItem = [[NSMenuItem alloc] initWithTitle:@"Girl" action:@selector(chooseGirl:) keyEquivalent:@""];
        [menu addItem:boyMenuItem];
        [menu addItem:girlMenuItem];
        [btn setMenu:menu];
        return cellView;
    }
    return nil;
}

- (void)chooseBoy:(id)sender {
    NSLog(@"chooseBoy");
}

- (void)chooseGirl:(id)sender {
    NSLog(@"chooseGirl");
}

#pragma mark - Select & Click Methods

//Single Click
- (void)tableViewSelectionDidChange:(NSNotification *)notification {
    NSTableView *table = notification.object;
    NSLog(@"userobjectinfo = %d",table.selectedRow);
}
//Double Click
- (void)doubleAction:(NSTableView *)tableView {
    NSLog(@"doubleAction = %@,row = %d",tableView,tableView.selectedRow);
}

#pragma mark - NSMenuDelegate Methods
- (void)menuNeedsUpdate:(NSMenu*)menu {
    NSInteger clickRow = self.tableView.clickedRow;
    NSInteger clickColumn = self.tableView.clickedColumn;
    if (clickColumn == 0) {
        NSMenuItem *testItem = [[NSMenuItem alloc] initWithTitle:@"TestForColumn" action:@selector(testMenuColumnItem:) keyEquivalent:@""];
        [self.tableView.menu addItem:testItem];
    } else {
        if (self.tableView.menu.itemArray.count > 1) {
            [self.tableView.menu removeItemAtIndex:self.tableView.menu.itemArray.count - 1];
        }
    }
}

- (void)testMenuItem:(id)sender {
    NSLog(@"testMenuItem");
}

- (void)testMenuColumnItem:(id)sender {
    NSLog(@"testMenu ColumnItem");
}

- (IBAction)cancelAdd:(id)sender {
    [self.view.window endSheet:self.panel];
}

- (IBAction)add:(id)sender {
    FRPerson *person = [[FRPerson alloc] initWithName:self.nameTF.stringValue andAddress:self.addrTF.stringValue];
    [personArray addObject:person];
    [self.tableView reloadData];
    [self.view.window endSheet:self.panel];
}

- (IBAction)addRow:(id)sender {

    [self.view.window beginSheet:self.panel completionHandler:^(NSModalResponse returnCode) {
        NSLog(@"%d",returnCode);
    }];
}

- (IBAction)delRow:(id)sender {
    [personArray removeLastObject];
    [self.tableView reloadData];
}


@end
