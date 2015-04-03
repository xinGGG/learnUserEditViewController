//
//  myGame.h
//  learn-test
//
//  Created by mac on 15/4/2.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface myGame : NSObject
@property (copy,nonatomic)NSString *myName;
@property (copy,nonatomic)NSString *myWhy;

-(id)initWithDic:(NSDictionary *)dic;
+(id)myGameWithDic:(NSDictionary *)dic;
@end
