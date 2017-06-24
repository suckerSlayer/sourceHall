//
//  DownloadManager.m
//  线day_04_仿SDWebImage
//
//  Created by sean on 17/6/24.
//  Copyright © 2017年 AAAA. All rights reserved.
//

#import "DownloadManager.h"

@implementation DownloadManager


+(instancetype)sharedManager{
    
    static id instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    
    return instance;
}



@end
