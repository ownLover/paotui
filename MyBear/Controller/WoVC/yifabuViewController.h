//
//  yifabuViewController.h
//  MyBear
//
//  Created by 紫平方 on 16/11/22.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "BaseViewController.h"

@interface yifabuViewController : BaseViewController <UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)UITableView *myTableView;
@property(nonatomic,retain)NSMutableArray *dataSource;
@property(nonatomic,retain)NSMutableDictionary *information;
@property(nonatomic,retain)NSString *type;
@end
