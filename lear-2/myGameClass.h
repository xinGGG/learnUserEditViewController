//
//  myGameClass.h
//  learn-test
//
//  Created by mac on 15/4/3.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface myGameClass : NSObject
@property (copy,nonatomic) NSString *myName;
@property (copy,nonatomic) NSString *myWhy;


-(id)initWithDic:(NSDictionary *)dic;
+(id)myGameClassWithDic:(NSDictionary *)dic;
@end
