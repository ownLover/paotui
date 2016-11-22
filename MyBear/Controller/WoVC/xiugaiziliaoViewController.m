//
//  xiugaiziliaoViewController.m
//  MyBear
//
//  Created by 紫平方 on 16/11/22.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "xiugaiziliaoViewController.h"

@interface xiugaiziliaoViewController ()

@end

@implementation xiugaiziliaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _nametf.text=LUserInor(@"nowName");
    _pwdtf.text=LUserInor(@"nowPwd");
    _numTf.text=LUserInor(@"nowNum");
}
- (IBAction)xiugai:(id)sender {
    
    
    NSArray *arr= [LUserDefault objectForKey:@"zhanghao"];
    NSMutableArray *array=[[NSMutableArray alloc]init];
    if ([arr isArray]) {
        [array addObjectsFromArray:arr];
    }
    
    [array replaceObjectAtIndex:[LUserInor(@"nowIndex") integerValue] withObject:@[_nametf.text,_pwdtf.text,_numTf.text]];
    [LUserDefault setObject:array forKey:@"zhanghao"];
    
    KKShowNoticeMessage(@"修改成功");
    [LUserDefault setObject:_nametf.text forKey:@"nowName"];
    [LUserDefault setObject:_pwdtf.text forKey:@"nowPwd"];
    [LUserDefault setObject:_numTf.text forKey:@"nowNum"];

    [self.navigationController popViewControllerAnimated:YES];
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
