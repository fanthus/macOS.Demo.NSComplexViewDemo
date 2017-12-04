//
//  FRTreeModel.m
//  NSOutlineViewDemo
//
//  Created by Fan's iMac  on 12/4/17.
//  Copyright © 2017 FanFrank. All rights reserved.
//

#import "FRTreeModel.h"

@implementation FRTreeModel

- (id)initWithName:(NSString *)tName {
    self = [super init];
    if (self) {
        self.name = tName;
        _treeModels = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name = %@, models = %@",self.name,self.treeModels];
}

@end
