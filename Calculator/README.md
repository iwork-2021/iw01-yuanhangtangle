# IW01-Calculator

> @author: 汤远航 (Tang Yuanhang)
>
> @StuID: 181840211
>
> @date: 2021/10/05

- [项目内容](#项目内容)
- [编程环境](#编程环境)
- [实现方法](#实现方法)
- [实现效果](#实现效果)

## 项目内容

实现一个支持单步操作的计算器app, 包括:

- 简单的实数运算
- 自动布局
- 稳定, 乱按不崩溃
- 横屏和竖屏显示不同内容

## 编程环境

在 window10 上使用 VMware Workstation 16 pro 运行黑苹果 MacOS Catalina 10.15, 使用 XCode 11.7 和 iphone 11 pro max 模拟器:

- Window 10
- VMware Workstation 16 Pro
- MacOS Catalina 10.15
- XCode 11.7
- simulator: iphone 11 pro max

## 实现方法

- 计算器 (model)
  - 仿照教程视频的实现方法, 对 Operations 进行拓展, 并自定义了一些函数处理错误输入
  - 出现错误结果时一律返回 0
- 用户界面 (View)
  - 分别使用storyboard绘制了竖屏(VerViewController)和横屏(HorViewController)状态下app界面, 竖屏的View为程序入口, 横屏界面根据我自己的使用习惯进行了简化, 数学符号使用 latex 风格书写 
  - 控件的组织通过stackView实现, 确定四个方向的边距后通过控制控件比例来实现自动布局
  - 总体上, 界面采用了黑底蓝字或白字的风格, 妥妥的码农趣味(doge)
- 控制器(Controller)
  - 总体上照搬了视频教程的写法, 添加了控制屏幕旋转的函数
  - 实现了两个view controller, 主要都是在处理数字输入, 操作符输入, 和屏幕旋转
  - 界面切换通过重载VerViewController中的 viewWillTransition 函数实现, 通过判断`size`的高和宽的相对大小确定展示哪一个view
  - 选定竖屏界面为初始界面

## 实现效果

- 竖屏:

<img src="D:\Calculator\Simulator Screen Shot - iPhone 11 Pro Max - 2021-10-05 at 06.39.38.png" style="zoom:25%" />

- 横屏:

<img src="D:\Calculator\Simulator Screen Shot - iPhone 11 Pro Max - 2021-10-05 at 06.39.58.png" style="zoom: 25%" />
