//
//  ViewController02.m
//  iosdemo
//
//  Created by 刘大志 on 2017/7/14.
//  Copyright © 2017年 刘大志. All rights reserved.
//

#import "ViewController02.h"

@interface ViewController02 ()

@end

@implementation ViewController02

// 属性和成员变量的同步
@synthesize timeView = _timeView;
@synthesize mySwitch = _mySwitch;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// 视图控制器2的背景
	self.view.backgroundColor = [UIColor orangeColor];
	
	UIButton* btn = [UIButton buttonWithType: UIButtonTypeRoundedRect];
	btn.frame = CGRectMake(150, 200, 80, 40);
	[btn setTitle:@"启动定时器" forState:UIControlStateNormal];
	[btn addTarget:self action:@selector(pressStart) forControlEvents:UIControlEventTouchUpInside];
	
	UIButton* btn01 = [UIButton buttonWithType: UIButtonTypeRoundedRect];
	btn01.frame = CGRectMake(200, 100, 80, 40);
	btn01.tag = 101;
	[btn01 setTitle:@"停止定时器" forState:UIControlStateNormal];
	[btn01 addTarget:self action:@selector(pressEnd) forControlEvents:UIControlEventTouchUpInside];
	
	[self.view addSubview:btn];
	[self.view addSubview:btn01];
	
	
	// 创建一个开关控件
	// 继承与UIView
	_mySwitch = [[UISwitch alloc] init];
	// 苹果官方的控件的位置设置位置x,y是可以改变,但是宽高是不可以改变,设置任何值都是无效的
	_mySwitch.frame = CGRectMake(100, 100, 10, 10);
	_mySwitch.on = YES;
	// 也可以采用set方法
	[_mySwitch setOn: YES];
	[self.view addSubview: _mySwitch];
	// 设置开启状态的风格颜色
	[_mySwitch setOnTintColor:[UIColor redColor]];
	// 设置开关圆按钮的颜色
	[_mySwitch setThumbTintColor:[UIColor yellowColor]];
	// 设置整体的风格颜色
	[_mySwitch setTintColor:[UIColor cyanColor]];
	// 设置开关监听事件
	[_mySwitch addTarget:self action:@selector(swChange:) forControlEvents:UIControlEventValueChanged];
}

- (void)swChange : (UISwitch*) sw {
	NSLog(@"当前开关的状态 : %@",sw.isOn == YES ? @"开" : @"关");
}

- (void)pressStart {
	// 使用类方法创建一个定时器,并且启动着定时器
	// p1:每隔多长事件调用定时器函数,以秒为单位
	// p2:表示实现定时器函数的对象
	// p3:表示定时器处理函数对象
	// p4:定时器函数中一个参数
	// p5:定时器是否重复,NO只完成一次函数的调用
	_timeView = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimer:) userInfo:@"小明" repeats:YES];
}

- (void)updateTimer: (NSTimer *) timer{
	//NSLog(@"test, name == %@", timer.userInfo);
	UIButton* view = [self.view viewWithTag:101];
	view.frame = CGRectMake(view.frame.origin.x + 5, view.frame.origin.y + 5, 80, 40);
}


- (void)pressEnd {
	[_timeView invalidate];
	NSLog(@"关闭计时器");
}
// 触摸时候触发的方法
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	// 先使当前的控制器消失掉
	// p1:是否有动画效果
	// p2:结束后是否需要调用功能block
	[self dismissViewControllerAnimated:YES completion:nil];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
