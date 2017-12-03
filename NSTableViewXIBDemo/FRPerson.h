//
//  FRPerson.h
//  NSTableViewDemo
//
//  Created by Fan's iMac  on 2017/8/7.
//  Copyright © 2017年 FanFrank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FRPerson : NSObject

@property (nonatomic,assign) NSInteger personID;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *addr;
@property (nonatomic,assign) NSInteger sex;

- (id)initWithName:(NSString *)tName andAddress:(NSString *)tAddr;

@end
