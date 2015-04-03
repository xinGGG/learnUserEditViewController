//
//  myGame.m
//  learn-test
//
//  Created by mac on 15/4/2.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import "myGame.h"

@implementation myGame


-(id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        _myName = [dic objectForKey:@"name"];
        _myWhy = [dic objectForKey:@"why"];
    }
    return self;
}

+(id)myGameWithDic:(NSDictionary *)dic
{
    myGame *game = [[self alloc]initWithDic:dic];
    return game;
}
@end
