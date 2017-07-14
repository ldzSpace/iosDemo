//
//  ViewController02.h
//  iosdemo
//
//  Created by 刘大志 on 2017/7/14.
//  Copyright © 2017年 刘大志. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController02 : UIViewController {

	// 定义一个时间定时器对象
	// 可以在每个时间间隔发送一个消息
	// 并通过此消息调用相应的事件函数
	// 通过此函数可以在固定的时间段完成一个根据事件间隔的任务
	NSTimer* _timeView;
}

// 定时器的属性对象
@property (retain, nonatomic) NSTimer* timeView;

@end
