//
//  FaBuViewController.m
//  MyBear
//
//  Created by 紫平方 on 16/11/22.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "FaBuViewController.h"

@interface FaBuViewController ()

@end

@implementation FaBuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_neirongtf setBorderColor:[UIColor grayColor] width:1];
    [self setNavRightButtonTitle:@"发布" selector:@selector(NavRightButtonClick)];
}

- (void)NavRightButtonClick{
    NSArray *arr=[LUserDefault objectForKey:@"renwu"];
    NSMutableArray *array=[[NSMutableArray alloc]init];
    if ([arr isArray]) {
        [array addObjectsFromArray:arr];
    }
    ;
    NSString *name=LUserInor(@"nowName");
    [array addObject:@{@"neiwai":_neiwai.text,
                       @"type":_typeLab.text,
                       @"title":_biaotitf.text,
                       @"content":_neirongtf.text,
                       @"jine":_jinetf.text,
                       @"time":_shijiantif.text,
                       @"jie":@"否",
                       @"wancheng":@"未",
                       @"name":name,
                       @"time":[NSDate getStringFromDate:[NSDate date] dateFormatter:KKDateFormatter02]
                       }];
    [LUserDefault setObject:array forKey:@"renwu"];
    KKShowNoticeMessage(@"发布成功");
    _neiwai.text=@"";
    _typeLab.text=@"";
    _biaotitf.text=@"";
    _neirongtf.text=@"";
    _jinetf.text=@"";
    _shijiantif.text=@"";
    
}
- (IBAction)xiaoneiwai:(id)sender {
    UIButton *btn=sender;
    _neiwai.text=btn.titleLabel.text;

}
- (IBAction)type:(id)sender {
    UIButton *btn=sender;
    _typeLab.text=btn.titleLabel.text;
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
