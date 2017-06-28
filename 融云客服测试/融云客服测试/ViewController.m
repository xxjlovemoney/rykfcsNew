//
//  ViewController.m
//  融云客服测试
//
//  Created by gagakj on 2017/6/27.
//  Copyright © 2017年 gagakj. All rights reserved.
//

#import "ViewController.h"
#import "RCDCustomerServiceViewController.h"

#import "UIView+Frame.h"

#import <objc/runtime.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *customButtom;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)customClick:(UIButton *)sender {
    RCDCustomerServiceViewController *chatService = [[RCDCustomerServiceViewController alloc] init];
#define SERVICE_ID @"KEFU149552510122584"
    
    chatService.conversationType = ConversationType_CUSTOMERSERVICE;
    chatService.targetId = SERVICE_ID;
    
//    chatService.chatSessionInputBarControl.backgroundColor = [UIColor redColor];
    //语音按钮隐藏
    chatService.chatSessionInputBarControl.switchButton.alpha = 0;
    //输入框的宽度和位置改变
    chatService.chatSessionInputBarControl.inputTextView.xxj_width = 232;
    chatService.chatSessionInputBarControl.inputTextView.xxj_x = 10;
    NSLog(@"inputTextView:%f,%f",chatService.chatSessionInputBarControl.inputTextView.frame.size.width,chatService.chatSessionInputBarControl.inputTextView.xxj_x);
    
    //表情按钮的背景图片改变
    [chatService.chatSessionInputBarControl.emojiButton setImage:[UIImage new] forState:UIControlStateNormal];
    
    
//    unsigned int outCount = 0;
//    Ivar *ivars = class_copyIvarList([chatService.chatSessionInputBarControl.emojiButton class], &outCount);
//    
//    for (NSInteger i = 0; i < outCount; ++i) {
//        // 遍历取出该类成员变量
//        Ivar ivar = *(ivars + i);
//        
//        NSLog(@"\n name = %s  \n type = %s", ivar_getName(ivar),ivar_getTypeEncoding(ivar));
//    }
//    
//    // 根据内存管理原则释放指针
//    free(ivars);
    
    
//    [chatService.chatSessionInputBarControl.emojiButton setValue:[UIImage imageNamed:@"chat smile"] forKey:@"_imageView"];
    
    
    
    
    chatService.title = @"在线客服";
    
    
    [self.navigationController pushViewController :chatService animated:YES];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
