#  Calculator

> @author :  汤远航
> @StuID: 181840211
>
> @date: 2021/10/04

## 项目思路

- 两个场景：
    - 竖屏，横屏：通过storyboard实现基本的UI设计
    - 通过屏幕方向切换时改变view实现
    
- 计算：实现一个计算器类

- 控制：两个场景各自的 view controller

基本的MVC框架如上

## 阶段一
实现竖屏下的计算器UI，model，以及Controller

- model：
    - 数字获取和操作获取
    - 为避免表达式求值的麻烦，考虑每次只使用一个操作符
    - 出现错误时直接 clear，需要使用错误处理
    - Swift 中有没有类似 Python 的 eval 的函数？
- 
## 阶段二
实现横屏状态下的计算机UI，修改阶段一的model，设计新的Controller

- 针对新的操作符进行计算，考虑在阶段一的时候进行合适的封装
- 设置从竖屏到横屏的屏幕显示切换

一个从来没有写过swift的小白选手要开始做project了！

> @date:2021/10/05

- 阶段一的任务完成了
    - 对ccgg的代码逻辑有了基本的理解，成功搞定了一个bug，对swift的optional有了新的理解
- 现在需要：
    - main中实现一个新的view
    - Calculator中定义新的操作
    - 关联操作
    - 实现切屏：这个东东得找找
      - viewWillTransition：定义在storyboard入口的controller内
- 阶段二任务完成！可以交差了。
- 写readme
