//
//  UIImageView+LSWebImage.h
//  线day_04_仿SDWebImage
//
//  Created by sean on 17/6/25.
//  Copyright © 2017年 AAAA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (LSWebImage)


@property (nonatomic,copy) NSString *preString;

-(void)ls_setImageWithUrlString:(NSString *)string;

@end
