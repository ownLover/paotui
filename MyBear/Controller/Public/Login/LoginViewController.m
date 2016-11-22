//
//  LoginViewController.m
//  MyBear
//
//  Created by 紫平方 on 16/11/15.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController{
    NSMutableDictionary *amudic;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"登录";

}
- (IBAction)login:(id)sender {
    
//    [LUITabBarController LUITabBarController:@[[MainViewController new],[FaBuViewController new],[WoViewController new]] titleArr:@[@"首页",@"发布",@"我"] imageArr:@[@"首页-首页",@"发布",@"wo"]];
//
//    return;
    
   NSArray *arr = [LUserDefault objectForKey:@"zhanghao"];
    if ([arr isArray]) {
        BOOL iscorect=NO;
        for (int i=0; i<arr.count; i++) {
           NSArray *array=arr[i];
            NSString *pwd=array[1];
            NSString *name=array[0];
            if (pwd&&[pwd isEqualToString:_pwdTf.text]) {
                if (name&&[name isEqualToString:_nameTf.text]) {
                    iscorect=YES;
                    [LUserDefault setObject:array[0] forKey:@"nowName"];
                    [LUserDefault setObject:array[1] forKey:@"nowPwd"];
                    [LUserDefault setObject:array[2] forKey:@"nowNum"];
                    [LUserDefault setObject:LString(i) forKey:@"nowIndex"];

                }
            }
            
        }
        if (iscorect) {
            
            [LUserDefault setObject:_nameTf.text forKey:@"nowName"];
            
            [LUITabBarController LUITabBarController:@[[MainViewController new],[FaBuViewController new],[WoViewController new]] titleArr:@[@"首页",@"发布",@"我"] imageArr:@[@"首页-首页",@"发布",@"wo"]];
            
        }else{
            KKShowNoticeMessage(@"用户名或密码错误");
        }
        

    }else{
        KKShowNoticeMessage(@"用户名或密码错误");

    }

    return;
    
    if ([[_nameTf.text trimLeftAndRightSpace] isEqualToString:@""]) {
        KKShowNoticeMessage(@"Enter UserName");
        return;
    }
    if ([[_pwdTf.text trimLeftAndRightSpace] isEqualToString:@""]) {
        KKShowNoticeMessage(@"Enter PassWord");
        return;
    }
    if ([_nameTf.text isEqualToString:@"123"]&&[_pwdTf.text isEqualToString:@"123"]) {
        KKShowNoticeMessage(@"Success");

    }

}
- (IBAction)regist:(id)sender {
    AddViewController *viewController = [[AddViewController alloc]init];
    [self.navigationController pushViewController:viewController animated:YES];

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
