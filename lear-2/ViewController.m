//
//  ViewController.m
//  lear-2
//
//  Created by mac on 15/4/2.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import "ViewController.h"
#import "editorViewController.h"
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

- (IBAction)trans:(id)sender {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationTransition: UIViewAnimationTransitionCurlUp forView:self.viewTrans cache:YES];
    [self.viewTrans exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    [UIView commitAnimations];
}

- (IBAction)otherBtn:(id)sender {
    editorViewController *edit = [[editorViewController alloc]init];
    [self presentViewController:edit animated:YES completion:^{}];
    
}
@end






