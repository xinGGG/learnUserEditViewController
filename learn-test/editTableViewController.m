//
//  editTableViewController.m
//  learn-test
//
//  Created by mac on 15/4/1.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import "editTableViewController.h"
#import "game.h"
@interface editTableViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
{
    NSMutableArray *_dataSoureceMyGame;
    NSMutableArray *_dataSoureceDeleteMyGame;
}

@end

@implementation editTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //初始化 准备数据模型
    _dataSoureceMyGame = [NSMutableArray array];
    for (int i = 0; i<100; i++) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setObject:[NSString stringWithFormat:@"标题 %d",i] forKey:@"name"];
        [dic setObject:[NSString stringWithFormat:@"内容 %d",i] forKey:@"why"];
        game *g2 = [game mygameWithDict:dic];
        [_dataSoureceMyGame addObject:g2];
    }
    _tableView.dataSource =self;
    _tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSoureceMyGame.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    game *g = _dataSoureceMyGame[indexPath.row];
    cell.textLabel.text = g.myGameName;
    cell.detailTextLabel.text = g.whyLoveGame;
    return cell;
}

//tableview的代理，监听cell的点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    game *g = _dataSoureceMyGame [indexPath.row];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"修改信息123" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    
    //设置文本框
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField *text = [alert textFieldAtIndex:0];
    text.text = g.myGameName;
    text.tag = indexPath.row;
    NSLog(@"cell 点击 %zi",indexPath.row);
    [alert show];
    
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_dataSoureceMyGame removeObjectAtIndex:indexPath.row];
        [_tableView
         deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"%zi",buttonIndex);
    if (!buttonIndex) return;
    UITextField *field = [alertView textFieldAtIndex:0];
    game *g = _dataSoureceMyGame[field.tag];
    g.myGameName = field.text;
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:field.tag inSection:0];
    [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
}

//编辑模式下的移动排序
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    game *sourceGame = _dataSoureceMyGame[sourceIndexPath.row];
    [_dataSoureceMyGame removeObjectAtIndex:sourceIndexPath.row];
    [_dataSoureceMyGame insertObject:sourceGame atIndex:destinationIndexPath.row];
}

- (IBAction)remove:(id)sender {
    BOOL isTableEditing = _tableView.isEditing;
    if (isTableEditing) {
        [_tableView setEditing:NO animated:YES];
    }else{
        [_tableView setEditing:YES animated:YES];
    }
}

- (IBAction)back:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (IBAction)edtorBtn:(UIButton *)sender {
}
- (IBAction)editerBtn:(id)sender {
}
@end
