//
//  ChatViewController.m
//  融云客服测试
//
//  Created by gagakj on 2017/6/27.
//  Copyright © 2017年 gagakj. All rights reserved.
//

#import "ChatViewController.h"

#import "YZInputView.h"

#import "UITextView+YZEmotion.h"

#import "UIView+Frame.h"

#import "ChatTableViewCell.h"
@interface ChatViewController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomHCons;

@property (weak, nonatomic) IBOutlet YZInputView *inputView;

@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (strong, nonatomic) YZEmotionKeyboard *emotionKeyboard;

@property (nonatomic, weak) UITableView * tableView;;


@property (nonatomic, strong) NSMutableArray * dataArray;


@end

@implementation ChatViewController

static NSString * cellId = @"cellId";

-(NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


// 懒加载键盘
- (YZEmotionKeyboard *)emotionKeyboard
{
    // 创建表情键盘
    if (_emotionKeyboard == nil) {
        
        YZEmotionKeyboard *emotionKeyboard = [YZEmotionKeyboard emotionKeyboard];
        
        emotionKeyboard.sendContent = ^(NSString *content){
            // 点击发送会调用，自动把文本框内容返回给你
            
            [self sendMessage:content];
            
            [self.inputView resignFirstResponder];
        };
        
        _emotionKeyboard = emotionKeyboard;
    }
    return _emotionKeyboard;
}






//发送消息
-(void)sendMessage:(NSString *)message
{
    // 构建消息的内容，这里以文本消息为例。
    RCTextMessage *testMessage = [RCTextMessage messageWithContent:message];
    // 调用RCIMClient的sendMessage方法进行发送，结果会通过回调进行反馈。
    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_PRIVATE
                                      targetId:@"xuxiaojun"
                                       content:testMessage
                                   pushContent:nil
                                      pushData:nil
                                       success:^(long messageId) {
                                           NSLog(@"发送成功。当前消息ID：%ld", messageId);
                                           NSLog(@"%@",testMessage.content);
                                           
                                           
                                           
                                           [self.dataArray addObject:testMessage];
                                           
                                           
                                           
                                           
                                           
                                           
                                           
                                           dispatch_async(dispatch_get_main_queue(), ^{
                                               //清空数据
                                               _inputView.text=@"";
                                               [self.tableView reloadData];
                                               //滚到最后一行
                                               
                                               
                                               NSIndexPath * path = [NSIndexPath indexPathForRow:self.dataArray.count-1 inSection:0];
                                               [self.tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionBottom animated:YES];

                                           });
                                           
                                           
                                       } error:^(RCErrorCode nErrorCode, long messageId) {
                                           NSLog(@"发送失败。消息ID：%ld， 错误码：%ld", messageId, (long)nErrorCode);
                                       }];
    
    
}



- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    if (text.length == 0) {
        
        return YES;
    }
    
    
    if ([text isEqualToString:@"\n"]){ //判断输入的字是否是回车，即按下return
        
        
        //失去第一响应者，就是键盘回收掉
        
        [self sendMessage:textView.text];
        
        [textView resignFirstResponder];
        
        //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
        
        
        return NO;
    }
    
    
    return YES;
}






- (IBAction)faceClick:(UIButton *)sender {
    
    if (_inputView.inputView == nil) {
        _inputView.yz_emotionKeyboard = self.emotionKeyboard;
//        [sender setBackgroundImage:[UIImage imageNamed:@"toolbar-text"] forState:UIControlStateNormal];
    } else {
        _inputView.inputView = nil;
        [_inputView reloadInputViews];
//        [sender setBackgroundImage:[UIImage imageNamed:@"smail"] forState:UIControlStateNormal];
    }
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加tableView
    [self setUpUI];
    
    
    self.inputView.returnKeyType = UIReturnKeySend;
    self.inputView.delegate = self;
    
    // 监听文本框文字高度改变
    _inputView.yz_textHeightChangeBlock = ^(NSString *text,CGFloat textHeight){
        // 文本框文字高度改变会自动执行这个【block】，可以在这【修改底部View的高度】
        // 设置底部条的高度 = 文字高度 + textView距离上下间距约束
        // 为什么添加10 ？（10 = 底部View距离上（5）底部View距离下（5）间距总和）
        _bottomHCons.constant = textHeight + 10;
    };
    
    // 设置文本框最大行数
//    _inputView.maxNumberOfLines = 4;

    
    [self.tableView registerClass:[ChatTableViewCell class] forCellReuseIdentifier:cellId];
    
}







-(void)setUpUI
{
    UITableView * tableView = [[UITableView alloc]init];
//    tableView.backgroundColor = [UIColor redColor];
    tableView.delegate = self
    ;
    tableView.dataSource = self
    ;
    
    [
     self.view addSubview:tableView];
    
    self.tableView= tableView;
    
}




-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.tableView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - self.bottomView.xxj_height - 64);
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    ChatTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];

    cell.message = self.dataArray[indexPath.row];
    
    return cell;
    
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChatTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    cell.message = self.dataArray[indexPath.row];
    
    return cell.rowHeight;
}


@end
