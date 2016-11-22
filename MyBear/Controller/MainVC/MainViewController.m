//
//  MainViewController.m
//  MyBear
//
//  Created by 紫平方 on 16/11/22.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "MainViewController.h"
#import "MainTableViewCell.h"

#import "XiangqingViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize myTableView;
@synthesize information;
@synthesize dataSource;


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSArray *arr=[LUserDefault objectForKey:@"renwu"];
    NSMutableArray *array=[[NSMutableArray alloc]init];
    if ([arr isArray]) {
        [array addObjectsFromArray:arr];
    }
    if (dataSource) {
        [dataSource removeAllObjects];
        [dataSource addObjectsFromArray:array];
        [myTableView reloadData];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    dataSource=[[NSMutableArray alloc]init];
    NSArray *arr=[LUserDefault objectForKey:@"renwu"];
    
    if ([arr isArray]) {
        [dataSource addObjectsFromArray:arr];
        NSLog(@"%@",arr);
    }

    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ApplicationWidth, ApplicationHeight)];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    //myTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
//    myTableView.estimatedRowHeight = 1000;
//    
//    myTableView.rowHeight = UITableViewAutomaticDimension;
    
    [myTableView setTableFooterView:[[UIView alloc]init]];
    myTableView.backgroundColor=[[UIColor whiteColor]colorWithAlphaComponent:0.5];
    [self.view addSubview:myTableView];

    
    [myTableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}


#pragma mark ========================================
#pragma mark ==UITableView
#pragma mark ========================================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier01=@"cell";
    MainTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier01];
    if (!cell) {
        cell=[[MainTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier01];
        

        
    }
    cell.nameLabn.text=dataSource[indexPath.row][@"title"];
    cell.jinelab.text=[NSString stringWithFormat:@"佣金：%@",dataSource[indexPath.row][@"jine"]];
    cell.backgroundColor=[[UIColor whiteColor]colorWithAlphaComponent:0.5];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = myBackgroundColor;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    XiangqingViewController *viewController = [[XiangqingViewController alloc]initWith:indexPath.row];
    viewController.isShow=YES;
    viewController.btnName=@"接受";
    [self.navigationController pushViewController:viewController animated:YES];

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
