//
//  DownloadManager.m
//  线day_04_仿SDWebImage
//
//  Created by sean on 17/6/24.
//  Copyright © 2017年 AAAA. All rights reserved.
//

#import "DownloadManager.h"
#import "DownloadOperation.h"

@interface DownloadManager ()

@property (nonatomic,strong) NSOperationQueue *queue;

@property (nonatomic,strong) DownloadOperation *preOp;


@end


@implementation DownloadManager

//shared
+(instancetype)sharedManager{
    
    static id instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    
    return instance;
}

//单例的初始化
- (instancetype)init
{
    self = [super init];
    if (self) {
       
        _queue = [NSOperationQueue new];
        
    }
    return self;
}
    



-(void)downloadOpreationWithURLString:(NSString *)string finishedBlock:(void(^)(UIImage *image))block{
    
    //单例接管取消上次下载
    if (_preOp != nil) {
        [_preOp cancel];
    }
    
    //让operation接管下载
    DownloadOperation *op =[DownloadOperation downloadOpreationWithURLString:string finishedBlock:^(UIImage *image){
        
    //把由operation传来的image传给外界(viewController)
        if (image != nil) {
            block(image);
        }
    }
            ];
    _preOp = op;
        [_queue addOperation:op];
}






@end
