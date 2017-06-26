//
//  LSTableViewCell.m
//  线day_03_12_SD异步下载网络图片
//
//  Created by sean on 17/6/22.
//  Copyright © 2017年 AAAA. All rights reserved.
//

#import "LSTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIImageView+LSWebImage.h"

@interface LSTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *downloadLabel;




@end


@implementation LSTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(appModel *)model{
    
    _nameLabel.text = model.name;
    _downloadLabel.text = model.download;
    
//    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:[UIImage imageNamed:@"user_default@2x" ] ];
    [_iconImageView ls_setImageWithUrlString:model.icon];
    
}

@end
