//
//  ViewController.m
//  iosdemo
//
//  Created by 刘大志 on 2017/7/13.
//  Copyright © 2017年 刘大志. All rights reserved.
//

#import "ViewController.h"
#import "ViewController02.h"

@interface ViewController ()

@end

@implementation ViewController

-(void) createView {
	// UIView是所有的view的基类,屏幕上所有能看到对象那个对象都是UIView的子类
	// UIView是一个矩形对象,是一个视图对象
	UIView *view = [UIView new];
	view.frame = CGRectMake(210, 210, 30, 30);
	view.backgroundColor = [UIColor redColor];
	[self.view addSubview:view];
	// 设置是否隐藏
	view.hidden = NO;
	// 设置是否透明 alpha = 1 : 是不透明,0是全透明
	view.alpha = 0.2;
	// 是否显示不透明
	view.opaque = NO;
	// 从父视图中删除
	[view removeFromSuperview];
	
	// 层级关系,先添加的view是在最下面,最新添加的就会在最上层,添加的先后关系决定这绘制顺序
	// 比如添加了三个view,下面的方法可以设置那个view放置到最前面
	[self.view bringSubviewToFront:view];
	// 下面的方法可以设置那个view放置到最后面
	[self.view sendSubviewToBack:view];
	// subView可以管理所有self.view的子视图的数组
	UIView *viewBack = self.view.subviews[0];
	// 拿到父视图
	self.view.superview;
}

-(void) create {
	UILabel *label = [UILabel new];
	// UILable的内容
	label.text = @"hollo World,what fuck this ,how i can study ios !";
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
	// 添加控件到view,这view就是整个当前的视图(根视图)
	[self.view addSubview:label];
	
	// lable的高级属性
	// 设置阴影的颜色
	label.shadowColor = [UIColor grayColor];
	// 设置阴影的偏移位置
	label.shadowOffset = CGSizeMake(5, 5);
	// 设置text对齐模式 默认是左侧对齐 :NSTextAlignmentLeft
	label.textAlignment = NSTextAlignmentCenter;
	// 设置label文字的显示的行数,默认是1, 如果文字只有2行,设置5行,也是显示2行,注意为0,系统会根据文字的量自动计算文字需要的行数,并设置文字需要显示的行数
	label.numberOfLines= 2;
}

-(void) createUIButton {
	// 通过类方法创建对象 ,这里不能使用alloc来创建,因为UIButton是自己管理内存
	UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	btn.tag = 102;
	btn.frame = CGRectMake(10, 300, 100, 40);
	btn.backgroundColor = [UIColor whiteColor];
	// 设置button 上的文字的大小
	btn.titleLabel.font = [UIFont systemFontOfSize:18];
	[btn setTitle:@"开启" forState:UIControlStateNormal];
	[btn setTitle:@"关闭" forState:UIControlStateHighlighted];
	[btn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
	[btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
	[btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:btn];
}

-(void) createImageButton {
	// 设置图片背景button 使用自定义类型
	UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
	btn.tag = 101;
	btn.frame = CGRectMake(200, 300, 100, 100);
	UIImage *icon01 = [UIImage imageNamed:@"btn01.png"];
	UIImage *icon02 = [UIImage imageNamed:@"btn02.png"];
	[btn setImage:icon01 forState:UIControlStateNormal];
	[btn setImage:icon02 forState:UIControlStateHighlighted];
	// 添加点击事件函数
	// 在btn按下抬起这个状态的时候触发添加的pressBtn函数,可以添加多个,多个按钮也可以同时添加同一个处理函数
	// p1 :谁来实现处理函数,就写谁
	// p2 :调用的处理事件函数
	// p3 :UIControlEvent :事件处理函数类型
	[btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
	[btn addTarget:self action:@selector(touchBtn) forControlEvents:UIControlEventTouchDown];
	[self.view addSubview:btn];
}

-(void) touchBtn {
	NSLog(@"触碰了");
}

-(void) pressBtn {
	NSLog(@"点击了");
}

// 当多个button都调用了该函数,如何区分是哪个Button,此时参数btn就可以起到区分的作用btn.target = 101;
-(void) pressBtn : (UIButton *) btn {
	
	if (btn.tag == 101) {
		
		NSLog(@"btn01");
		
	} else if (btn.tag == 102){
		
		NSLog(@"btn02");
	}
	
}

// 当前控制器的视图即将显示时,调用此函数
// 视图分为: 1 显示前, 2 正在处于显示状态 3 已经被隐藏
// 参数: 表示切换时候动画是否显示
// 每次显示都会调用,但是viewDidLoad 自会加载一次相当于onCreate
// 下面这些方法相当于android的生命周期方法,onstart(),onResume() onStop() ,onPause()
-(void) viewWillAppear:(BOOL)animated {
	NSLog(@"视图即将出现 :viewWillAppear");
}

// 视图即将消失,调用此函数
-(void) viewWillDisappear:(BOOL)animated {
	NSLog(@"视图即将消失 : viewWillDisappear");
}

// 当前视图已经显示到了屏幕后瞬间调用此函数
-(void) viewDidAppear:(BOOL)animated {
	NSLog(@"视图已经出现 : viewDidAppear");
}

// 当前视图已经消失了
-(void) viewDidDisappear:(BOOL)animated {
	NSLog(@"视图已经消失 : viewDidDisappear");
}

// 触摸时调用该方法
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	// 创键新的视图控制器
	ViewController02* vc = [ViewController02 new];
	// 显示新的视图控制器到屏幕上
	// p1:新的视图控制器对象
	// p2:是否使用动画切换效果
	// p3:切换结束后功能调用,不需要传nil值即可
	[self presentViewController : vc animated : YES completion : nil];
}

// 当视图控制器第一次被加载显示视图时,调用此函数
// 布局初始化视图来使用,初始化资源使用
// 只会加载一次
-(void) viewDidLoad {
	[super viewDidLoad];
	
	// 调用创键UI函数
	[self create];
	[self createView];
	[self createUIButton];
	[self createImageButton];
	NSLog(@"视图第一次创键 : viewDidLoad");
}

// 当系统内存过低时,会发起警告信息,调用此函数
- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}


@end
