//
//  FRPerson.m
//  NSTableViewDemo
//
//  Created by Fan's iMac  on 2017/8/7.
//  Copyright © 2017年 FanFrank. All rights reserved.
//

#import "FRPerson.h"

@implementation FRPerson

- (id)initWithName:(NSString *)tName andAddress:(NSString *)tAddr {
    self = [super init];
    if (self) {
        self.name = tName;
        self.addr = tAddr;
    }
    return self;
}

@end
