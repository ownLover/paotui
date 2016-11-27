//
//  XiangqingViewController.m
//  MyBear
//
//  Created by 紫平方 on 16/11/22.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "XiangqingViewController.h"

@interface XiangqingViewController ()

@end

@implementation XiangqingViewController
{
    NSDictionary *datasource;
    NSUInteger nowIndex;
}
@synthesize isShow;
@synthesize btnName;

- (instancetype)initWith:(NSInteger )index
{
    self = [super init];
    if (self) {
        nowIndex=index;
        NSArray *arr=[LUserDefault objectForKey:@"renwu"];
        NSMutableArray *array=[[NSMutableArray alloc]init];
        if ([arr isArray]) {
            [array addObjectsFromArray:arr];
        }
        datasource = [array objectAtIndex:index];

    }
    return self;
}
- (void)remove{
    NSArray *arr=[LUserDefault  objectForKey:@"yijieshou"];
    NSMutableArray *array=[[NSMutableArray alloc]init];
    if ([arr isArray]) {
        [array addObjectsFromArray:arr];
    }
    [array removeObject:datasource];
    [LUserDefault setObject:array forKey:@"yijieshou"];

}

- (IBAction)jieshou:(id)sender {
    
    if ([btnName isEqualToString:@"完成"]) {
        
        
        NSArray *arr=[LUserDefault  objectForKey:@"yiwancheng"];
        NSMutableArray *array=[[NSMutableArray alloc]init];
        if ([arr isArray]) {
            [array addObjectsFromArray:arr];
        }
        [array addObject:datasource];
        [datasource setValue:LUserInor(@"nowName") forKey:@"wanchengren"];
        [LUserDefault setObject:array forKey:@"yiwancheng"];
        
        
        
        [self remove];
        
        [self.navigationController popViewControllerAnimated:YES];
        

        
        return;
    }
    
    if ([[datasource objectForKey:@"name"] isEqualToString:LUserInor(@"nowName")]) {
        KKShowNoticeMessage(@"不能接受自己的任务");
        return;
    }
    
    KKShowNoticeMessage(@"已接受");
    
    NSArray *arr=[LUserDefault  objectForKey:@"yijieshou"];
    NSMutableArray *array=[[NSMutableArray alloc]init];
    if ([arr isArray]) {
        [array addObjectsFromArray:arr];
    }
    [datasource setValue:LUserInor(@"nowName") forKey:@"jieshouren"];
    [array addObject:datasource];
    [LUserDefault setObject:array forKey:@"yijieshou"];
    
    
    
    
    
    
    
    [self.navigationController popViewControllerAnimated:YES];

}

- (void)del{
    NSArray *arr=[LUserDefault objectForKey:@"renwu"];
    NSMutableArray *array=[[NSMutableArray alloc]init];
    if ([arr isArray]) {
        [array addObjectsFromArray:arr];
    }
    NSMutableDictionary *adic = [[NSMutableDictionary alloc]initWithDictionary:[array objectAtIndex:nowIndex]];;
    [adic setObject:@"YES" forKey:@"yibeijieshou"];
    [array replaceObjectAtIndex:nowIndex withObject:adic];
    [LUserDefault setObject:array forKey:@"renwu"];
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"详情";
    // Do any additional setup after loading the view from its nib.
    _biaoti.text=datasource[@"title"];
    _neirong.text=datasource[@"content"];
    _shangjin.text=[NSString stringWithFormat:@"佣金：%@ 元",datasource[@"jine"]];
    _shijian.text=[NSString stringWithFormat:@"时间:%@",datasource[@"time"]];
    _neiwai.text=datasource[@"neiwai"];
    _leixing.text=datasource[@"type"];
    _faburen.text=[NSString stringWithFormat:@"发布人:%@",datasource[@"name"]];
    if (isShow==NO) {
        _jieshouBnt.hidden=YES;
    }
    [_jieshouBnt setTitle:btnName forState:UIControlStateNormal];
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
