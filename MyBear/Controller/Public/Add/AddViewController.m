//
//  AddViewController.m
//  MyBear
//
//  Created by 紫平方 on 16/11/15.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController{
    NSInteger selectIndex;
    NSMutableDictionary *amudic;
}

@synthesize myTableView;
@synthesize information;
@synthesize dataSource;
@synthesize dataSource1;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
    
}

- (void)NavRightButtonClick{
    
   NSArray *arr= [LUserDefault objectForKey:@"zhanghao"];
    NSMutableArray *array=[[NSMutableArray alloc]init];
    if ([arr isArray]) {
        [array addObjectsFromArray:arr];
    }
    [array addObject:@[information[0],information[1],information[2]]];

    [LUserDefault setObject:array forKey:@"zhanghao"];
    
    KKShowNoticeMessage(@"注册成功");
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)initUI{
    self.title=@"注册";
    [self setNavRightButtonTitle:@"注册" selector:@selector(NavRightButtonClick)];
    
    dataSource1=[[NSMutableArray alloc]init];
    dataSource=[[NSMutableArray alloc]init];
    information=[[NSMutableArray alloc]init];
    [dataSource addObjectsFromArray:@[@"用户名",@"密码",@"电话"]];
    for (int i=0; i<dataSource.count; i++) {
        [information addObject:@""];
    }
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ApplicationWidth, ApplicationHeight)];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    //myTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [myTableView setTableFooterView:[[UIView alloc]init]];
    
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
    cell.textLabel.text=[dataSource objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[information objectAtIndex:indexPath.row];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = myBackgroundColor;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    selectIndex=indexPath.row;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIAlertView *myAlert = [[UIAlertView alloc] initWithTitle:@"输入数据" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];
    [myAlert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [[myAlert textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeNumberPad];
    [myAlert show];
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        [information replaceObjectAtIndex:selectIndex withObject:[alertView textFieldAtIndex:0].text];
    }
    
    [myTableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
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

@end
