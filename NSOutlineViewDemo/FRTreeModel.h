//
//  FRTreeModel.h
//  NSOutlineViewDemo
//
//  Created by Fan's iMac  on 12/4/17.
//  Copyright © 2017 FanFrank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FRTreeModel : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSMutableArray<FRTreeModel *> *treeModels;

- (id)initWithName:(NSString *)tName;

@end
