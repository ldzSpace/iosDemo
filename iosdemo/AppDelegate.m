//
//  AppDelegate.m
//  iosdemo
//
//  Created by 刘大志 on 2017/7/13.
//  Copyright © 2017年 刘大志. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

// 当程序框架初始化成功后调用此函数
// 该函数用来初始化整个程序框架结构,这也是整个程序的入口函数
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	// 整个程序只有一个UIWindow对象,也是继承UIView,是一个特殊的UIView
	// window就是展示屏幕的视图,所以初始化创建的时候,初始化区域(Frame)的大小为主屏幕(mainScreen)的宽高
	// UIScreen:表示屏幕硬件的表示类
	// mainScreen 获取主屏幕的设备信息 硬件表示对象
	// bounds 表示屏幕的宽高值
//	self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//	// 创建一个视图控制器作为UIWindow的根视图控制器,Main.storyboard就是通过该对象加载进来
//	// 整个UIKit框架只有一个根视图控制器,属于window
//	// 视图控制器用来管理界面和处理界面的逻辑类对象
//	// 视图控制器相当于android里面的activity
//	self.window.rootViewController = [UIViewController new];
//	
//	// 设置背景色
//	self.window.backgroundColor = [UIColor orangeColor];
//	// 使window有效并显示到屏幕上,window是屏幕上显示的所有能看见的区域,包括状态栏
//	[self.window makeKeyAndVisible];
	// 每个UIView都包含window属性,这些window都是指向唯一的window
	// UIView *view = [UIView new];
	// view.backgroundColor = [UIColor blueColor];
	
	// 记住: 我们这里是删除了info.plist中的Main StoryBoard file base name
	// 上面的代码是不用写的,因为系统框架会自动根据Main storyBoard file这个行去加载创键跟ViewControl
	return YES;
}


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
