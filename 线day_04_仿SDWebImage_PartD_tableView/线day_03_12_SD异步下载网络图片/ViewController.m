//
//  ViewController.m
//  线day_03_12_SD异步下载网络图片
//
//  Created by sean on 17/6/22.
//  Copyright © 2017年 AAAA. All rights reserved.
//

//https://raw.githubusercontent.com/suckerSlayer/sourceHall/master/apps.json

#import "ViewController.h"
#import "AFNetworking.h"
#import "YYModel.h"
#import "appModel.h"
#import "LSTableViewCell.h"

@interface ViewController ()

//@property (nonatomic,strong) NSOperationQueue *queue;
@property (nonatomic,strong) NSArray * dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//创建全局队列
//    _queue = [NSOperationQueue new];

    [self loadData];
}

-(void)loadData{
    
    NSString *jsonString = @"https://raw.githubusercontent.com/suckerSlayer/sourceHall/master/apps.json";
    
    [[AFHTTPSessionManager manager]GET:jsonString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
      
        NSArray *dictArray = responseObject;
        
        self.dataArray = [NSArray yy_modelArrayWithClass:[appModel class] json:dictArray];
                
        [self.tableView reloadData];
        
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dd" forIndexPath:indexPath];
    appModel *model = self.dataArray[indexPath.row];
    cell.model = model;
    return cell;
    
}


@end


















