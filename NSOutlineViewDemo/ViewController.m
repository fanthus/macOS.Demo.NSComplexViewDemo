//
//  ViewController.m
//  NSOutlineViewDemo
//
//  Created by Fan's iMac  on 12/3/17.
//  Copyright © 2017 FanFrank. All rights reserved.
//

#import "ViewController.h"
#import "FRTreeModel.h"

@interface ViewController()<NSOutlineViewDelegate,NSOutlineViewDataSource> {
    NSScrollView *scrollView;
    NSOutlineView *outlineView;
    FRTreeModel *rootModel;   //rootModel 是不进行展示的.
}
@end

@implementation ViewController

- (void)prepareData {
    rootModel = [[FRTreeModel alloc] initWithName:@"/"];

    FRTreeModel *firstModel = [[FRTreeModel alloc] initWithName:@"Company"];
    [rootModel.treeModels addObject:firstModel];

    FRTreeModel *firstModel_1 = [[FRTreeModel alloc] initWithName:@"Frank"];
    [firstModel.treeModels addObject:firstModel_1];
    FRTreeModel *firstModel_2 = [[FRTreeModel alloc] initWithName:@"Smith"];
    [firstModel.treeModels addObject:firstModel_2];

    FRTreeModel *firstModel_1_1 = [[FRTreeModel alloc] initWithName:@"XXX"];
    [firstModel_1.treeModels addObject:firstModel_1_1];


}

- (void)viewDidLoad {
    [self prepareData];

    outlineView = [[NSOutlineView alloc] initWithFrame:NSMakeRect(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    outlineView.indentationPerLevel = 18;
    outlineView.autoresizesOutlineColumn = YES;
    outlineView.delegate = self;
    outlineView.dataSource = self;
    [self.view addSubview:outlineView];

    NSTableColumn *firstCol = [[NSTableColumn alloc] initWithIdentifier:@"firstCol"];
    [outlineView addTableColumn:firstCol];

    scrollView = [[NSScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.documentView = outlineView;
    [self.view addSubview:scrollView];
}

#pragma mark - NSOutlineViewDataSource Methods

- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(nullable id)item {
    NSLog(@"outlineView = %@ numberOfChildrenOfItem = %@",outlineView,item);
    if (item == nil) {
        return rootModel.treeModels.count;
    }
    if ([item isKindOfClass:[FRTreeModel class]]) {
        return ((FRTreeModel *)item).treeModels.count;
    }
    return 0;
}

- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(nullable id)item {
    NSLog(@"outlineView = %@ child = %ld ofItem = %@",outlineView,(long)index,item);
    if (item == nil) {
        return [rootModel.treeModels objectAtIndex:index];
    }
    FRTreeModel *treeModel = [((FRTreeModel *)item).treeModels objectAtIndex:index];
    return treeModel;
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item {
    NSLog(@"outlineView = %@ isItemExpandable = %@",outlineView,item);
    return ((FRTreeModel *)item).treeModels.count > 0 ? YES : NO;
}

- (NSView *)outlineView:(NSOutlineView *)outlineView viewForTableColumn:(NSTableColumn *)tableColumn item:(id)item ;
{
    NSTextField *field  =  (NSTextField *)[outlineView makeViewWithIdentifier:@"MyView" owner:self];
    if (field == nil) {
        field = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 100, 50)];
        field.identifier = @"MyView";
    }
    FRTreeModel *model = item;
    field.stringValue = model.name;
    CGRect frame = field.frame;
    field.frame = NSMakeRect(frame.origin.x-150, frame.origin.y, frame.size.width, frame.size.height);
    return field;
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    // Update the view, if already loaded.
}


@end

