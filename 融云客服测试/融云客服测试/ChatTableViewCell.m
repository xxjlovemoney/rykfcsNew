//
//  ChatTableViewCell.m
//  融云客服测试
//
//  Created by gagakj on 2017/6/27.
//  Copyright © 2017年 gagakj. All rights reserved.
//

#import "ChatTableViewCell.h"

@interface ChatTableViewCell ()
@property(weak,nonatomic) UIButton * chatBtn;//聊天信息
@end

@implementation ChatTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //添加自控件
       
        
        //聊天信息
        UIButton * chatBtn = [[UIButton alloc]init];
        chatBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [chatBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        //设置内容内边距，下面按钮的大小宽高也额外增加40
        
        chatBtn.contentEdgeInsets = UIEdgeInsetsMake(15, 20, 25, 20);
        chatBtn.titleLabel.numberOfLines = 0;
        [chatBtn sizeToFit];
        [self.contentView addSubview: chatBtn];
        
        self.chatBtn= chatBtn;

    }
    
    return self;
}


-(void)setMessage:(RCTextMessage *)message
{
    _message = message;
    
    //boundingRectWithSize先确定最大可以设置多大，再根据消息的内容，字体具体设置
    
    
    CGSize size = [message.content boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width/2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15.0f]} context:nil].size;
    
    //因为上面聊天里面的内容设置了内边距，距离上下左右都是20，所以聊天的按钮大小也增大一下
    CGSize realsize = CGSizeMake(size.width+40, size.height+20);
    
    //判断在聊天按钮在左边右边
    
    
    
    
//    CGFloat x = [UIScreen mainScreen].bounds.size.width - realsize.width - 10;
    self.chatBtn.frame = CGRectMake(10, 10, realsize.width, realsize.height);
    
    [self.chatBtn setTitle:message.content forState:UIControlStateNormal];
    
    
    
}





-(CGFloat)rowHeight
{
    //返回聊天信息按钮的最大的Y值
    return CGRectGetMaxY(self.chatBtn.frame)+10;
}
































@end
