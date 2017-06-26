//
//  DownloadOperation.h
//  线day_04_仿SDWebImage
//
//  Created by sean on 17/6/23.
//  Copyright © 2017年 AAAA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NSString+path.h"
#import "NSString+Hash.h"

@interface DownloadOperation : NSOperation

//搞两个属性

//接收url

+(instancetype)downloadOpreationWithURLString:(NSString *)string finishedBlock:(void(^)(UIImage *image))block;


@end
