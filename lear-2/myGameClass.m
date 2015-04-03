//
//  myGameClass.m
//  learn-test
//
//  Created by mac on 15/4/3.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import "myGameClass.h"

@implementation myGameClass
-(id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        _myName = [dic objectForKey:@"name"];
        _myWhy = [dic  objectForKey:@"why"];
    }
    return self;
}

+(id)myGameClassWithDic:(NSDictionary *)dic
{
    myGameClass *game = [[myGameClass alloc] initWithDic:dic];
    return game;
}
@end
