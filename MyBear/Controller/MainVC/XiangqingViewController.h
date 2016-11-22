//
//  XiangqingViewController.h
//  MyBear
//
//  Created by 紫平方 on 16/11/22.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "BaseViewController.h"

@interface XiangqingViewController : BaseViewController
- (instancetype)initWith:(NSInteger )index;

@property (weak, nonatomic) IBOutlet UILabel *biaoti;
@property (weak, nonatomic) IBOutlet UILabel *neirong;

@property (weak, nonatomic) IBOutlet UILabel *shangjin;
@property (weak, nonatomic) IBOutlet UILabel *shijian;
@property (weak, nonatomic) IBOutlet UILabel *neiwai;
@property (weak, nonatomic) IBOutlet UILabel *leixing;
@property (weak, nonatomic) IBOutlet UILabel *faburen;
@property (weak, nonatomic) IBOutlet UIButton *jieshouBnt;

@property(nonatomic,assign)BOOL isShow;

@property(nonatomic,retain)NSString *btnName;
@end
