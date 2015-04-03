//
//  ViewController.m
//  learn-test
//
//  Created by mac on 15/4/1.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import "ViewController.h"
#import "editTableViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)otherBtn:(id)sender {
}

- (IBAction)otherBtn:(id)sender {
}

- (IBAction)transformBtn:(id)sender {
}
- (IBAction)otherBtn:(id)sender {
}

- (IBAction)transformBtn:(UIButton *)sender {
//    //动画启动
//    [UIView beginAnimations:nil context:nil];
//    //动画执行时间
//    [UIView setAnimationDuration:0.5];
//    //动画执行的方式 指定某个view的变化执行动画
//    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.currentSliderParentView cache:YES];
//    //对象修改属性
//    [self.currentSliderParentView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
//    //动画结束
//    [UIView commitAnimations];
//    

    //动画启动
    [UIView beginAnimations:nil context:nil];
    //动画执行时间
    // 用方法来改成员变量的参数
    [UIView setAnimationDuration:1];
    //动画执行的方式 指定某个view的变化执行动画
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.currentSliderParentView cache:YES];
    //对象修改属性
    [self.currentSliderParentView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    //动画结束
    [UIView commitAnimations];
    
    
    
}

- (IBAction)tableViewTranBtn:(id)sender {
    editTableViewController *editController = [[editTableViewController alloc] init];
    [self presentViewController:editController animated:YES completion:^{}];
}

- (IBAction)transform:(id)sender {
}
@end
