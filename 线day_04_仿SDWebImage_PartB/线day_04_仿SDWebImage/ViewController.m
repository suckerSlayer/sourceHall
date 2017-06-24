//
//  ViewController.m
//  线day_04_仿SDWebImage
//
//  Created by sean on 17/6/23.
//  Copyright © 2017年 AAAA. All rights reserved.
//

#import "ViewController.h"
#import "DownloadOperation.h"
#import "AFNetworking.h"
#import "YYModel.h"
#import "APPModel.h"
#import "DownloadManager.h"


@interface ViewController ()

//@property (nonatomic,strong) NSOperationQueue *queue;

@property (nonatomic,strong) NSArray<APPModel *> *dataArray;

@property (nonatomic,weak) IBOutlet UIImageView *imageView;

//@property (nonatomic,strong) DownloadOperation *preOp;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //创建队列
//    _queue = [NSOperationQueue new];
    
    [self loadData];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    //准备图片地址1.
//    NSString *imageString = @"http://paper.taizhou.com.cn/tzwb/res/1/2/2015-01/20/12/res03_attpic_brief.jpg";
    //准备图片地址2.
    int random = arc4random_uniform((uint32_t)self.dataArray.count);
    
    NSString *imageString = self.dataArray[random].icon;
    
//    if (_preOp != nil) {
//        [_preOp cancel];
//    }
    
//    //创建operation
//    DownloadOperation *op = [DownloadOperation downloadOpreationWithURLString:imageString finishedBlock:^(UIImage *image) {
//        _imageView.image = image;
//           }];
//    
//    _preOp = op;
    
    //添加到队列
//    [_queue addOperation:op];
    
    
//    单例接管下载
     [[DownloadManager sharedManager] downloadOpreationWithURLString:imageString finishedBlock:^(UIImage *image) {
        
         _imageView.image = image;

    }];

    
}



-(void)loadData{
    
    NSString *jsonString = @"https://raw.githubusercontent.com/suckerSlayer/sourceHall/master/apps.json";
    
    [[AFHTTPSessionManager manager]GET:jsonString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *dictArray = responseObject;
        
        self.dataArray = [NSArray yy_modelArrayWithClass:[APPModel class] json:dictArray];
        NSLog(@"%@",self.dataArray);
    }
                               failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    
    
    
}





@end
