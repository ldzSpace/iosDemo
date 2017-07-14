//
//  main.m
//  iosdemo
//
//  Created by 刘大志 on 2017/7/13.
//  Copyright © 2017年 刘大志. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

// 整个App程序的主函数,入口函数
int main(int argc, char * argv[]) {
	// 自动内存释放池
	@autoreleasepool {
		// UIKit框架的启动函数
		// p1: argc,启动时带有的参数个数
		// p2: 参数列表
		// p3: 要求传入一个主框架类名,如果参数为nil,系统会自动用默认的框架类作为主框架类名
		// p4: 主框架的代理类对象名称,(先将类名转换成字符串传入)
		// 如果p3为nil,则the UIApplication class is used
	    return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
	}
}
