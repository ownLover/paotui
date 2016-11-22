//
//  WoViewController.m
//  MyBear
//
//  Created by 紫平方 on 16/11/22.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "WoViewController.h"
#import "yifabuViewController.h"
#import "yijieshouViewController.h"
#import "yiwanchengViewController.h"
#import "xiugaiziliaoViewController.h"

@interface WoViewController ()

@end

@implementation WoViewController
@synthesize myTableView;
@synthesize information;
@synthesize dataSource;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    dataSource=[[NSMutableArray alloc]init];
    [dataSource addObject:@"修改资料"];
    [dataSource addObject:@"已发布任务"];
    [dataSource addObject:@"已接受任务"];
    [dataSource addObject:@"已完成任务"];
    [dataSource addObject:@"退出"];
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ApplicationWidth, ApplicationHeight-44)];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    //myTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    //myTableView.estimatedRowHeight = 1000;
    
    //myTableView.rowHeight = UITableViewAutomaticDimension;
    
    [myTableView setTableFooterView:[[UIView alloc]init]];
    
    
    
//    1.个人中心：主要实现个人资料修改，修改密码，查看已发布和已完成的任务等。

    [self.view addSubview:myTableView];

}

#pragma mark ========================================
#pragma mark ==UITableView
#pragma mark ========================================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier01=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier01];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier01];
    }
    cell.textLabel.text=dataSource[indexPath.row];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = myBackgroundColor;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    [dataSource addObject:@"修改资料"];
//    [dataSource addObject:@"已发布任务"];
//    [dataSource addObject:@"已接受任务"];
//    [dataSource addObject:@"已完成任务"];
//    [dataSource addObject:@"退出"];
    
    if (indexPath.row==0) {
        xiugaiziliaoViewController *viewController = [[xiugaiziliaoViewController alloc]init];
        [self.navigationController pushViewController:viewController animated:YES];

    }
    
    if (indexPath.row==1) {
        yifabuViewController *viewController = [[yifabuViewController alloc]init];
        viewController.type=@"已发布";
        [self.navigationController pushViewController:viewController animated:YES];

    }
    
    if (indexPath.row==2) {
        yifabuViewController *viewController = [[yifabuViewController alloc]init];
        viewController.type=@"已接受";
        [self.navigationController pushViewController:viewController animated:YES];
        
    }
    if (indexPath.row==3) {
        yifabuViewController *viewController = [[yifabuViewController alloc]init];
        viewController.type=@"已完成";
        [self.navigationController pushViewController:viewController animated:YES];
        
    }
    
    if (indexPath.row==4) {
        UINavigationController *nav=[[UINavigationController alloc]init];
        LoginViewController *viewController = [[LoginViewController alloc]init];
        nav.viewControllers=@[viewController];
        [UIApplication sharedApplication].keyWindow.rootViewController=nav;

    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
//
//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return UITableViewCellEditingStyleDelete;
//}
//
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//
//    }
//}


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

@end
