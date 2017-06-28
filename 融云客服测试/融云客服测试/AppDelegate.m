//
//  AppDelegate.m
//  融云客服测试
//
//  Created by gagakj on 2017/6/27.
//  Copyright © 2017年 gagakj. All rights reserved.
//

#import "AppDelegate.h"
#import <RongIMLib/RongIMLib.h>

#define appKey @"82hegw5u8k11x"
#define token @"BPebcrdGnGuoyMifInzRvhi0fu7C2RwZ/i/0VybXWhVpiD+NCY9DkWDA3VzwR0gyVMpRh9L7gGKBRyeYDzjlsw=="

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[RCIMClient sharedRCIMClient] initWithAppKey:appKey];
    
    
    [[RCIMClient sharedRCIMClient] connectWithToken:token
                                            success:^(NSString *userId) {
                                                NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
                                            } error:^(RCConnectErrorCode status) {
                                                NSLog(@"登陆的错误码为:%ld", (long)status);
                                            } tokenIncorrect:^{
                                                //token过期或者不正确。
                                                //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
                                                //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
                                                NSLog(@"token错误");
                                            }];
    
//    //异常对象:NSException
//    //参数：将函数的地址给它
//    NSSetUncaughtExceptionHandler(&getException);
    
    return YES;
}


/*
//获得异常的C函数
void getException(NSException *exception)
{
    NSLog(@"名字：%@",exception.name);
    NSLog(@"原因：%@",exception.reason);
    NSLog(@"用户信息：%@",exception.userInfo);
    NSLog(@"栈内存地址：%@",exception.callStackReturnAddresses);
    NSLog(@"栈描述：%@",exception.callStackSymbols);
    //每次启动的时候将，捕获的异常信息，反馈给服务器
    //获取当前设备
    UIDevice*divice=[UIDevice currentDevice];
    //1.系统版本
    NSString*systemVersion=divice.systemVersion;
    //2.app当前版本
    //先获取当前infoplist文件数据
    NSDictionary*infoDic=[[NSBundle mainBundle] infoDictionary];
    //然后从字典中取出版本号
    NSString*version=[infoDic objectForKey:@"CFBundleShortVersionString"];
    NSLog(@"系统版本%@",version);
    //3.系统时间
    NSDate*date=[NSDate date];
    //4.设备种类
    NSString*model=divice.model;
    //将捕获的异常数据进行保存，保存到本地
    //可以在下一次启动的时候将数据发给服务器
}

*/


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
