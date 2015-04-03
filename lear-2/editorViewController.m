//
//  editorViewController.m
//  learn-test
//
//  Created by mac on 15/4/3.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import "editorViewController.h"
#import "myGameClass.h"
@interface editorViewController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>
{
    NSMutableArray *_dataSourceArray;
}
@end

@implementation editorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataSourceArray = [NSMutableArray array];
    // Do any additional setup after loading the view from its nib.
    for (int i = 0; i < 40; i ++) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setObject:[NSString stringWithFormat:@"asdf--%d",i] forKey:@"name"];
        [dic setObject:[NSString stringWithFormat:@"content - %d",i] forKey:@"why"];
        myGameClass *game = [myGameClass myGameClassWithDic:dic];
        [_dataSourceArray addObject:game];
    }
    _tableView.dataSource = self;
    _tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  _dataSourceArray.count;
}

//tableCell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    }
    myGameClass *game = _dataSourceArray[indexPath.row];
    cell.textLabel.text = game.myName;
    cell.detailTextLabel.text = game.myWhy;
    return cell;
}

//tablecell 点击事件
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    myGameClass *game = _dataSourceArray [indexPath.row];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"修改信息" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField *field = [alert textFieldAtIndex:0];
    field.text = game.myName;
    field.tag = indexPath.row;
    NSLog(@"cell点击的时候－－－－%zi",indexPath.row);

    [alert show];
}
//uialert 代理事件

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"%zi",buttonIndex);

    if (!buttonIndex)return;
    UITextField *field = [alertView textFieldAtIndex:0];
    myGameClass *game = _dataSourceArray[field.tag];
    game.myName = field.text;
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:field.tag inSection:0];
    [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

//cell 删除
- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //当前对象  indexPath
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_dataSourceArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (IBAction)editor:(id)sender {
    BOOL isEditing = _tableView.isEditing;
    if (isEditing) {
        [_tableView setEditing:NO animated:YES];
    }else{
        [_tableView setEditing:YES animated:YES];
    }
    
}
@end
