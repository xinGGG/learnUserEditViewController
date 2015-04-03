//
//  editorViewController.h
//  learn-test
//
//  Created by mac on 15/4/3.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface editorViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)back:(id)sender;
- (IBAction)editor:(id)sender;
@end
