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
@synthesize mySlider = _mySlider;
@synthesize myButton01 = _myButton01;
@synthesize myButton02 = _myButton02;
@synthesize myProgress = _myProgress;
@synthesize mySegControl = _segControl;
@synthesize myAlterView = _alterView;
@synthesize myIndicatorView = _activtiyIndicator;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// 视图控制器2的背景
	self.view.backgroundColor = [UIColor whiteColor];
	
	[self createButton];
	[self createSwitch];
	[self createProgress];
	[self createSilder];
	[self creatStepper];
	[self createSegmentControl];
	[self createAlterView];
	[self createIndicatorView];
	[self.view addSubview:_myButton01];
	[self.view addSubview:_myButton02];
    [self.view addSubview: _mySwitch];
	[self.view addSubview:_myProgress];
	[self.view addSubview:_mySlider];
	[self.view addSubview:_myStepper];
}

- (void) createButton {
	_myButton01 = [UIButton buttonWithType: UIButtonTypeRoundedRect];
	_myButton01.frame = CGRectMake(150, 200, 80, 40);
	[_myButton01 setTitle:@"启动定时器" forState:UIControlStateNormal];
	[_myButton01 addTarget:self action:@selector(pressStart) forControlEvents:UIControlEventTouchUpInside];
	
	_myButton02 = [UIButton buttonWithType: UIButtonTypeRoundedRect];
	_myButton02.frame = CGRectMake(200, 100, 80, 40);
	_myButton02.tag = 101;
	[_myButton02 setTitle:@"停止定时器" forState:UIControlStateNormal];
	[_myButton02 addTarget:self action:@selector(pressEnd) forControlEvents:UIControlEventTouchUpInside];
}

- (void) createSwitch {
	// 创建一个开关控件
	// 继承与UIView
	_mySwitch = [[UISwitch alloc] init];
	// 苹果官方的控件的位置设置位置x,y是可以改变,但是宽高是不可以改变,设置任何值都是无效的
	_mySwitch.frame = CGRectMake(100, 100, 10, 10);
	_mySwitch.on = YES;
	// 也可以采用set方法
	[_mySwitch setOn: YES];
	// 设置开启状态的风格颜色
	[_mySwitch setOnTintColor:[UIColor redColor]];
	// 设置开关圆按钮的颜色
	[_mySwitch setThumbTintColor:[UIColor yellowColor]];
	// 设置整体的风格颜色
	[_mySwitch setTintColor:[UIColor cyanColor]];
	// 设置开关监听事件
	[_mySwitch addTarget:self action:@selector(swChange:) forControlEvents:UIControlEventValueChanged];
}

- (void) createProgress {
	// 进度条的创建
	_myProgress = [[UIProgressView alloc] init];
	// 设置进度条的位置大小,同时进度条的高度是不可变化
	_myProgress.frame = CGRectMake(10, 80, 200, 30);
	// 设置进度 范围 0~1
	_myProgress.progress = 0;
	// 设置进度条的风格特征
	_myProgress.progressViewStyle = UIProgressViewStyleDefault;
	// 设置进度条的颜色
	_myProgress.progressTintColor = [UIColor magentaColor];
	// 设置进度条未达到的部分的颜色
	_myProgress.trackTintColor = [UIColor blackColor];
}

// 设置滑动条
- (void) createSilder {
	// 创建滑动条
	_mySlider = [[UISlider alloc] init];
	// 滑动条位置的设置 ,高度是不可以改变的
	_mySlider.frame = CGRectMake(10, 200, 200, 40);
	// 设置滑动条的最大值
	_mySlider.maximumValue = 100;
	// 设置滑动条的最小值
	_mySlider.minimumValue = 0;
	// 设置滑动条的滑块位置float值
	_mySlider.value = 0;
	// 左侧滑动条的背景颜色
	_mySlider.minimumTrackTintColor = [UIColor blackColor];
	// 右侧滑动条的背景颜色
	_mySlider.maximumTrackTintColor = [UIColor greenColor];
	// 设置滑块的颜色
	_mySlider.thumbTintColor = [UIColor purpleColor];
	// 添加对滑动条的时间函数
	[_mySlider addTarget:self action:@selector(slideProgress) forControlEvents:UIControlEventValueChanged];
}

- (void) creatStepper {
	// 创建步进器
	_myStepper = [[UIStepper alloc] init];
	// 设置位置,宽高不能变
	_myStepper.frame = CGRectMake(100, 400, 80, 40);
	_myStepper.minimumValue = 0;
	_myStepper.maximumValue = 100;
	_myStepper.value = 10;
	// 步进器每次向前或者向后的步伐值
	_myStepper.stepValue = 5;
	// 是否可以重复的响应事件的操作,如果按住就会一直加,否者要松开后才变化
	_myStepper.autorepeat = YES;
	// 是否将步伐结果通过事件函数响应出来,如果在autorepeat为yes的时候我们continuous为no,就不会连续输出调用函数点击是,后面一直在增长,但是松开的时候才调用函数
	_myStepper.continuous = NO;
	[_myStepper addTarget:self action:@selector(stepperAction) forControlEvents:UIControlEventValueChanged];
}

- (void) createSegmentControl {
	// 创建分栏控件
	_segControl = [[UISegmentedControl alloc] init];
	// 设置控件位置,宽高是可以改变的
	_segControl.frame = CGRectMake(100, 500, 200, 40);
	// 添加按钮元素 atIndex 按钮的索引位置
	[_segControl insertSegmentWithTitle:@"0元" atIndex:0 animated:YES];
	[_segControl insertSegmentWithTitle:@"5元" atIndex:1 animated:YES];
	[_segControl insertSegmentWithTitle:@"10元" atIndex:2 animated:YES];
	// 设置当前默认按钮索引位置
	_segControl.selectedSegmentIndex = 0;
	[_segControl addTarget:self action:@selector(segChange) forControlEvents:UIControlEventValueChanged];
	
	[self.view addSubview:_segControl];
}

- (void) createAlterView {
	_alterView = [[UIAlertView alloc] initWithTitle:@"警告" message:@"别点了" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"OK", nil];
}

- (void)createIndicatorView {
	_activtiyIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(250, 150, 80, 80)];
	// 设置提示风格:灰.白.大白
	_activtiyIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
	[self.view addSubview:_activtiyIndicator];
	[_activtiyIndicator startAnimating];
}

- (void)alertView: (UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	NSLog(@"index = %ld \n", buttonIndex);
}

- (void)alertView :(UIAlertView*)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
	NSLog(@"对话框已经消失");
}

- (void)alertView: (UIAlertView*)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
	NSLog(@"对话框即将消失");
	
}

- (void) segChange {
	NSLog(@"%ld", _segControl.selectedSegmentIndex);
}

- (void) stepperAction {
	
	NSLog(@"stepper : value = %f", _myStepper.value);
}

- (void) slideProgress {
	_myProgress.progress = (_mySlider.value - _mySlider.minimumValue ) / (_mySlider.maximumValue - _mySlider.minimumValue);
	NSLog(@"value = %f", _mySlider.value);
	NSLog(@"progress = %f", _myProgress.progress);
}

- (void) swChange : (UISwitch*) sw {
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
	[_alterView show];
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
