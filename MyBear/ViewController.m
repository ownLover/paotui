//
//  ViewController.m
//  MyBear
//
//  Created by 紫平方 on 16/9/30.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [LUITabBarController LUITabBarController:@[[MainViewController new],[FaBuViewController new],[WoViewController new]] titleArr:@[@"首页",@"发布",@"我"] imageArr:@[@"首页-首页",@"发布",@"wo"]];
    

    
}

- (void)centerBtnClick{
    UITabBarController *tab = (UITabBarController*)[UIApplication sharedApplication].keyWindow.rootViewController;
    tab.selectedIndex=3;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
