//
//  UIImageView+LSWebImage.m
//  线day_04_仿SDWebImage
//
//  Created by sean on 17/6/25.
//  Copyright © 2017年 AAAA. All rights reserved.
//

#import "UIImageView+LSWebImage.h"
#import "DownloadManager.h"
#import <objc/runtime.h>

@implementation UIImageView (LSWebImage)

-(void)setPreString:(NSString *)preString{
    
    objc_setAssociatedObject(self, "key",preString, OBJC_ASSOCIATION_COPY_NONATOMIC);


}

-(NSString *)preString{
    
    return objc_getAssociatedObject(self, "");
}


-(void)ls_setImageWithUrlString:(NSString *)string{
    
    if (self.preString != nil && ![self.preString isEqualToString:string] ) {
        
        [[DownloadManager sharedManager] cancelLastOpWithString:self.preString];
        
    }
    
    self.preString = string;
    
    
    
    //    单例接管下载
    [[DownloadManager sharedManager] downloadOpreationWithURLString:string finishedBlock:^(UIImage *image) {
        
        self.image = image;
        
    }];

    
    
}

@end
