//
//  game.h
//  learn-test
//
//  Created by mac on 15/4/1.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface game : NSObject
@property (nonatomic,copy)NSString *myGameName;
@property (nonatomic,copy)NSString *whyLoveGame;


-(id)initWithDict:(NSDictionary *)dict;
+(id)mygameWithDict:(NSDictionary *)dict;
@end
