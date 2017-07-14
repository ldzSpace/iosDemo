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
	UIButton* _myButton01;
	UIButton* _myButton02;
	UISwitch* _mySwitch;
	UISlider* _mySlider;
	UIStepper* _myStepper;
	UIAlertView* _alterView;
	UIProgressView* _myProgress;
	UISegmentedControl* _segControl;
	UIActivityIndicatorView* _activtiyIndicator;
}

// 警告对话框属性对象
@property (retain, nonatomic) UIAlertView* myAlterView;
// 等待提示对象
@property (retain, nonatomic) UIActivityIndicatorView* myIndicatorView;
// 分栏控制器属性对象
@property (retain, nonatomic) UISegmentedControl* mySegControl;
// 步进器的属性对象
@property (retain, nonatomic) UIStepper* myStepper;
// 按钮01属性对象
@property (retain, nonatomic) UIButton* myButton01;
// 按钮02属性对象
@property (retain, nonatomic) UIButton* myButton02;
// 滑动条的属性对象
@property (retain, nonatomic) UISlider* mySlider;
// shitch属性对象
@property (retain, nonatomic) UISwitch* mySwitch;
// 定时器的属性对象
@property (retain, nonatomic) NSTimer* timeView;
// 进度条的属性对象
@property (retain, nonatomic) UIProgressView* myProgress;

@end
