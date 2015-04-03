//
//  editTableViewController.h
//  learn-test
//
//  Created by mac on 15/4/1.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface editTableViewController : UIViewController
- (IBAction)editerBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)remove:(id)sender;
- (IBAction)back:(UIButton *)sender;
@end
