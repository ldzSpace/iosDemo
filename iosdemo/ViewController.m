//
//  ViewController.m
//  iosdemo
//
//  Created by 刘大志 on 2017/7/13.
//  Copyright © 2017年 刘大志. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void) create {
	UILabel* label = [UILabel new];
	// UILable的内容
	label.text = @"hollo World!";
	// UILabel文字的颜色
	label.textColor = [UIColor blueColor];
	// CGRect的参数分别为左上坐标,以及长和宽
	label.frame = CGRectMake(100, 100, 160, 40);
	// UILabel的背景色
	//label.backgroundColor = [UIColor redColor];
	// 设置字体的大小
	label.font = [UIFont systemFontOfSize:12];
	// 设置整个视图的背景色
	//self.view.backgroundColor = [UIColor yellowColor];
	// 添加控件到view,这view就是整个当前的视图,相当于android的activity
	[self.view addSubview:label];
	
	// lable的高级属性
	// 设置阴影的颜色
	label.shadowColor = [UIColor grayColor];
	// 设置阴影的偏移位置
	label.shadowOffset = CGSizeMake(5, 5);
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	// 调用创键UI函数
	[self create];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	
}


@end
