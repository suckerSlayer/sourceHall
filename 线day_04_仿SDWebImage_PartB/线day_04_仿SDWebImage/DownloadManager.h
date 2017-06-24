//
//  DownloadManager.h
//  线day_04_仿SDWebImage
//
//  Created by sean on 17/6/24.
//  Copyright © 2017年 AAAA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DownloadManager : NSObject


+(instancetype)sharedManager;

-(void)downloadOpreationWithURLString:(NSString *)string finishedBlock:(void(^)(UIImage *image))block;

@end
