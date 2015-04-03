//
//  game.m
//  learn-test
//
//  Created by mac on 15/4/1.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import "game.h"

@implementation game


-(id)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        _myGameName = [dict objectForKey:@"name"];
        _whyLoveGame = [dict objectForKey:@"why"];
    }
    return self;
}
+(id)mygameWithDict:(NSDictionary *)dict
{
    game *game = [[self alloc] initWithDict:dict];
    return game;
}
@end
