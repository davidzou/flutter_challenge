// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Flutter code sample for ChangeNotifier with an AnimatedBuilder

// import 'package:flutter/material.dart';
//
// class CounterBody extends StatelessWidget {
//   const CounterBody({super.key, required this.counterValueNotifier});
//
//   final ValueNotifier<int> counterValueNotifier;
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           const Text('Current counter value:'),
//           // Thanks to the [AnimatedBuilder], only the widget displaying the
//           // current count is rebuilt when `counterValueNotifier` notifies its
//           // listeners. The [Text] widget above and [CounterBody] itself aren't
//           // rebuilt.
//           AnimatedBuilder(
//             // [AnimatedBuilder] accepts any [Listenable] subtype.
//             animation: counterValueNotifier,
//             builder: (BuildContext context, Widget? child) {
//               return Text('${counterValueNotifier.value}');
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   final ValueNotifier<int> _counter = ValueNotifier<int>(0);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('AnimatedBuilder example')),
//         body: CounterBody(counterValueNotifier: _counter),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () => _counter.value++,
//           child: const Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(const MyApp());
// }

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui';
import 'package:svg_drawing_animation/svg_drawing_animation.dart';

// import 'package:fetch/fetch.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       home: ScoreBoardDemo(),
//     )
//   );
// }

// import 'package:flutter/material.dart';
// import 'package:badges/badges.dart';
//
// class NumberGestureDemo extends StatefulWidget {
//   const NumberGestureDemo({Key? key}) : super(key: key);
//
//   @override
//   _NumberGestureDemoState createState() => _NumberGestureDemoState();
// }
//
// class _NumberGestureDemoState extends State<NumberGestureDemo> {
//   int _number = 0; // 数字的初始值
//   double _startY = 0.0; // 手势开始时的纵坐标
//   double _endY = 0.0; // 手势结束时的纵坐标
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('数字手势上下滑动示例'),
//       ),
//       body: Center(
//         child: GestureDetector(
//           onVerticalDragStart: (details) {
//             // 记录手势开始时的纵坐标
//             _startY = details.localPosition.dy;
//           },
//           onVerticalDragUpdate: (details) {
//             // 记录手势移动时的纵坐标
//             _endY = details.localPosition.dy;
//           },
//           onVerticalDragEnd: (details) {
//             // 计算手势移动的距离
//             double distance = _endY - _startY;
//             // 如果距离大于10像素，就增加数字的值
//             if (distance > 10) {
//               setState(() {
//                 _number++;
//               });
//             }
//             // 如果距离小于-10像素，就减少数字的值
//             if (distance < -10) {
//               setState(() {
//                 _number--;
//               });
//             }
//           },
//           child: Badge(
//             badgeContent: Text(
//               '$_number',
//               style: TextStyle(color: Colors.white),
//             ),
//             child: Icon(
//               Icons.notifications,
//               size: 100,
//             ),
//             badgeColor: Colors.pink, // 数字的背景色
//             position:
//             BadgePosition.topEnd(top: 0, end: 0), // 数字的位置，右上角
//           ),
//         ),
//       ),
//     );
//   }
// }

// class NumberGestureDemo extends StatefulWidget {
//   const NumberGestureDemo({Key? key}) : super(key: key);
//
//   @override
//   _NumberGestureDemoState createState() => _NumberGestureDemoState();
// }
//
// class _NumberGestureDemoState extends State<NumberGestureDemo>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller; // 动画控制器
//   late Animation<double> _animation; // 动画对象
//   int _number = 0; // 数字的初始值
//   double _startY = 0.0; // 手势开始时的纵坐标
//   double _endY = 0.0; // 手势结束时的纵坐标
//
//   @override
//   void initState() {
//     super.initState();
//     // 初始化动画控制器，设置动画时长为2秒
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );
//     // 初始化动画对象，设置范围为-200到0
//     _animation = Tween<double>(begin: 0, end: 0).animate(_controller);
//   }
//
//   @override
//   void dispose() {
//     // 销毁动画控制器
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('数字手势上下滑动示例'),
//       ),
//       body: Center(
//         child: GestureDetector(
//           onVerticalDragStart: (details) {
//             // 记录手势开始时的纵坐标
//             _startY = details.localPosition.dy;
//           },
//           onVerticalDragUpdate: (details) {
//             // 记录手势移动时的纵坐标
//             _endY = details.localPosition.dy;
//           },
//           onVerticalDragEnd: (details) {
//             // 计算手势移动的距离
//             double distance = _endY - _startY;
//             // 如果距离大于10像素，就增加数字的值，并启动动画
//             if (distance > 10) {
//               setState(() {
//                 _number++;
//               });
//               _controller.forward(from: 0);
//             }
//             // 如果距离小于-10像素，就减少数字的值，并启动动画
//             if (distance < -10) {
//               setState(() {
//                 _number--;
//               });
//               _controller.forward(from: 0);
//             }
//           },
//           child: AnimatedBuilder(
//             animation: _animation,
//             builder: (context, child) {
//               // return Transform.translate(
//               //   offset: Offset(0, _animation.value),
//               //   child: child,
//               // );
//               return Transform(
//                 alignment: Alignment.bottomCenter,
//                 transform: Matrix4.identity()
//                   ..setEntry(3, 2, 0.001)
//                   ..rotateX(_animation.value),
//                 child: child,
//               );
//             },
//             child: Text(
//               '$_number',
//               style: TextStyle(fontSize: 200, color: Colors.blue),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// class NumberFlipDemo extends StatefulWidget {
//   const NumberFlipDemo({Key? key}) : super(key: key);
//
//   @override
//   _NumberFlipDemoState createState() => _NumberFlipDemoState();
// }
//
// class _NumberFlipDemoState extends State<NumberFlipDemo>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller; // 动画控制器
//   late Animation<double> _animation; // 动画对象
//   int _number = 0; // 数字的初始值
//   double _startY = 0.0; // 手势开始时的纵坐标
//   double _endY = 0.0; // 手势结束时的纵坐标
//
//   @override
//   void initState() {
//     super.initState();
//     // 初始化动画控制器，设置动画时长为1秒
//     _controller = AnimationController(
//       duration: const Duration(seconds: 1),
//       vsync: this,
//     );
//     // 初始化动画对象，设置范围为0到pi/2
//     _animation = Tween<double>(begin: 0, end: math.pi / 2).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut),);
//   }
//
//   @override
//   void dispose() {
//     // 销毁动画控制器
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('数字上下翻滚示例'),
//       ),
//       body: Center(
//         child: GestureDetector(
//           onVerticalDragStart: (details) {
//             // 记录手势开始时的纵坐标
//             _startY = details.localPosition.dy;
//           },
//           onVerticalDragUpdate: (details) {
//             // 记录手势移动时的纵坐标
//             _endY = details.localPosition.dy;
//           },
//           onVerticalDragEnd: (details) {
//             // 计算手势移动的距离
//             double distance = _endY - _startY;
//             // 如果距离大于10像素，就增加数字的值，并启动动画
//             if (distance > 10) {
//               setState(() {
//                 _number++;
//               });
//               _controller.forward(from: 0);
//             }
//             // 如果距离小于-10像素，就减少数字的值，并启动动画
//             if (distance < -10) {
//               setState(() {
//                 _number--;
//               });
//               _controller.forward(from: 0);
//             }
//           },
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               Text(
//                 '${_number + 1}',
//                 style: TextStyle(fontSize: 100, color: Colors.blue),
//               ),
//               ClipRect(
//                 child: Align(
//                   alignment: Alignment.bottomCenter,
//                   heightFactor: 0.5,
//                   child: AnimatedBuilder(
//                     animation: _animation,
//                     builder: (context, child) {
//                       return Transform(
//                         alignment: Alignment.bottomCenter,
//                         transform: Matrix4.identity()
//                           ..setEntry(3, 2, 0.001)
//                           ..rotateX(_animation.value),
//                         child: child,
//                       );
//                     },
//                     child: Text(
//                       '$_number',
//                       style:
//                       TextStyle(fontSize: 100, color: Colors.blue.shade200),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// class NumberFlipDemo extends StatefulWidget {
//   const NumberFlipDemo({Key? key}) : super(key: key);
//
//   @override
//   _NumberFlipDemoState createState() => _NumberFlipDemoState();
// }
//
// class _NumberFlipDemoState extends State<NumberFlipDemo>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller; // 动画控制器
//   late Animation<double> _animation; // 动画对象
//   int _number = 0; // 数字的初始值
//   double _startY = 0.0; // 手势开始时的纵坐标
//   double _endY = 0.0; // 手势结束时的纵坐标
//   bool _isIncreasing = true; // 数字是否在增加
//
//   @override
//   void initState() {
//     super.initState();
//     // 初始化动画控制器，设置动画时长为500毫秒
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );
//     // 初始化动画对象，设置范围为0到pi/2，并使用弹性曲线
//     _animation = Tween<double>(begin: 0, end: math.pi / 2).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
//     );
//   }
//
//   @override
//   void dispose() {
//     // 销毁动画控制器
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('数字上下翻滚示例'),
//       ),
//       body: Center(
//         child: GestureDetector(
//           onVerticalDragStart: (details) {
//             // 记录手势开始时的纵坐标
//             _startY = details.localPosition.dy;
//           },
//           onVerticalDragUpdate: (details) {
//             // 记录手势移动时的纵坐标
//             _endY = details.localPosition.dy;
//           },
//           onVerticalDragEnd: (details) {
//             // 计算手势移动的距离
//             double distance = _endY - _startY;
//             // 如果距离大于10像素，就增加数字的值，并启动动画，并设置_isIncreasing为true
//             if (distance > 10) {
//               setState(() {
//                 _number++;
//                 _isIncreasing = true;
//               });
//               _controller.forward(from: 0);
//             }
//             // 如果距离小于-10像素，就减少数字的值，并启动动画，并设置_isIncreasing为false
//             if (distance < -10) {
//               setState(() {
//                 _number--;
//                 _isIncreasing = false;
//               });
//               _controller.forward(from: 0);
//             }
//           },
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               Text(
//                 '${_number + (_isIncreasing ? -1 : 1)}',
//                 style: TextStyle(fontSize: 100, color: Colors.blue),
//               ),
//               ClipRect(
//                 child: Align(
//                   alignment: Alignment.bottomCenter,
//                   // Alignment(_isIncreasing ? -1.0 : 1.0, -1.0), // 根据_isIncreasing来调整对齐方式
//                   heightFactor: 0.5,
//                   child: AnimatedBuilder(
//                     animation: _animation,
//                     builder: (context, child) {
//                       print("isIncreasing: $_isIncreasing");
//                       return Transform(
//                         alignment: Alignment.bottomCenter,
//                         // Alignment(_isIncreasing ? -1.0 : 1.0, -1.0), // 根据_isIncreasing来调整旋转中心点
//                         transform: Matrix4.identity()
//                           ..setEntry(3, 2, 0.001)
//                           ..rotateX(_animation.value * (_isIncreasing ? -1 : 1)), // 根据_isIncreasing来调整旋转方向
//                         child: child,
//                       );
//                     },
//                     child: Text(
//                       '$_number',
//                       style:
//                       TextStyle(fontSize: 100, color: Colors.blue.shade200),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// class ScoreBoardDemo extends StatefulWidget {
//   const ScoreBoardDemo({Key? key}) : super(key: key);
//
//   @override
//   _ScoreBoardDemoState createState() => _ScoreBoardDemoState();
// }
//
// class _ScoreBoardDemoState extends State<ScoreBoardDemo>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller; // 动画控制器
//   late Animation<double> _animation; // 动画对象
//   int _number = 0; // 数字的初始值
//   double _startY = 0.0; // 手势开始时的纵坐标
//   double _endY = 0.0; // 手势结束时的纵坐标
//
//   @override
//   void initState() {
//     super.initState();
//     // 初始化动画控制器，设置动画时长为500毫秒
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );
//     // 初始化动画对象，设置范围为0到1，并使用线性曲线
//     _animation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.linear),
//     );
//   }
//
//   @override
//   void dispose() {
//     // 销毁动画控制器
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('计分牌数字翻动示例'),
//       ),
//       body: Center(
//         child: GestureDetector(
//           onVerticalDragStart: (details) {
//             // 记录手势开始时的纵坐标
//             _startY = details.localPosition.dy;
//           },
//           onVerticalDragUpdate: (details) {
//             // 记录手势移动时的纵坐标
//             _endY = details.localPosition.dy;
//           },
//           onVerticalDragEnd: (details) {
//             // 计算手势移动的距离
//             double distance = _endY - _startY;
//             // 如果距离大于10像素，就增加数字的值，并启动动画
//             if (distance > 10) {
//               setState(() {
//                 _number++;
//               });
//               _controller.forward(from: 0);
//             }
//             // 如果距离小于-10像素，就减少数字的值，并启动动画
//             if (distance < -10) {
//               setState(() {
//                 _number--;
//               });
//               _controller.forward(from: 0);
//             }
//           },
//           child: CustomPaint(
//             size: Size(100, 100), // 设置画布大小为100x100
//             painter: NumberFlipPainter(_number, _animation.value), // 设置自定义绘制器
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class NumberFlipPainter extends CustomPainter {
//   final int number; // 要显示的数字
//   final double value; // 动画的值，范围为0到1
//
//   NumberFlipPainter(this.number, this.value);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint(); // 创建一个画笔对象
//     paint.color = Colors.blue; // 设置画笔颜色为蓝色
//     paint.style = PaintingStyle.fill; // 设置画笔样式为填充
//
//     var textStyle = TextStyle(// 创建一个文本样式对象
//       color: Colors.white, // 设置文本颜色为白色
//       fontSize: size.height * 0.8, // 设置文本字号为高度的80%
//       fontWeight: FontWeight.bold, // 设置文本粗细为粗体
//     );
//
//     var textSpan = TextSpan(// 创建一个文本片段对象
//       text: '$number', // 设置文本内容为数字
//       style: textStyle, // 设置文本样式
//     );
//
//     var textPainter = TextPainter(// 创建一个文本绘制器对象
//       text: textSpan, // 设置文本片段
//       textAlign: TextAlign.center, // 设置文本对齐方式为居中
//       textDirection: TextDirection.ltr, // 设置文本方向为从左到右
//     );
//
//     textPainter.layout(); // 进行文本布局
//
//     var textOffset = Offset(// 计算文本的偏移量，使其居中显示
//       (size.width - textPainter.width) / 2,
//       (size.height - textPainter.height) / 2,
//     );
//
//     var path = Path(); // 创建一个路径对象
//
//     if (value < 0.5) {
//       // 如果动画值小于0.5，表示数字从下面翻到上面的过程
//       path.moveTo(0, size.height / 2); // 移动到左中点
//       path.lineTo(size.width, size.height / 2); // 画一条水平线到右中点
//       path.cubicTo(// 画一条三次贝塞尔曲线到右下角，控制点分别为右中点和右下角的中点
//         size.width,
//         size.height / 2,
//         size.width,
//         size.height * 3 / 4,
//         size.width,
//         size.height,
//       );
//       path.lineTo(0, size.height); // 画一条水平线到左下角
//       path.cubicTo(// 画一条三次贝塞尔曲线到左中点，控制点分别为左下角的中点和左中点
//         0,
//         size.height * 3 / 4,
//         0,
//         size.height / 2,
//         0,
//         size.height / 2,
//       );
//       path.close(); // 关闭路径
//
//       canvas.clipPath(path); // 使用路径裁剪画布
//
//       canvas.drawColor(Colors.blue.shade200, BlendMode.srcOver); // 在画布上绘制浅蓝色
//
//       canvas.transform(Matrix4.identity() // 使用矩阵变换画布，实现数字的旋转效果
//           .storage
//         ..[15] = 1.0 // 设置透视效果
//         ..[5] = math.cos(math.pi * value) // 设置y轴缩放比例，根据动画值计算
//         ..[13] = size.height / 2 * math.sin(math.pi * value) // 设置y轴平移距离，根据动画值计算
//         ..[6] = -math.sin(math.pi * value) // 设置z轴旋转角度，根据动画值计算
//         ..[9] = math.sin(math.pi * value)); // 设置z轴旋转角度，根据动画值计算
//
//       textPainter.paint(canvas, textOffset); // 在变换后的画布上绘制文本
//
//     } else {
//       // 如果动画值大于等于0.5，表示数字从上面翻到下面的过程
//       path.moveTo(0, size.height / 2); // 移动到左中点
//       path.lineTo(size.width, size.height / 2); // 画一条水平线到右中点
//       path.cubicTo(// 画一条三次贝塞尔曲线到右上角，控制点分别为右中点和右上角的中点
//         size.width,
//         size.height / 2,
//         size.width,
//         size.height / 4,
//         size.width,
//         0,
//       );
//       path.lineTo(0, 0); // 画一条水平线到左上角
//       path.cubicTo(// 画一条三次贝塞尔曲线到左中点，控制点分别为左上角的中点和左中点
//         0,
//         size.height / 4,
//         0,
//         size.height / 2,
//         0,
//         size.height / 2,
//       );
//       path.close(); // 关闭路径
//
//       canvas.clipPath(path); // 使用路径裁剪画布
//
//       canvas.drawColor(Colors.blue.shade200, BlendMode.srcOver); // 在画布上绘制浅蓝色
//
//       canvas.transform(Matrix4.identity() // 使用矩阵变换画布，实现数字的旋转效果
//           .storage
//         ..[15] = 1.0 // 设置透视效果
//         ..[5] = math.cos(math.pi * (value - 0.5)) // 设置y轴缩放比例，根据动画值计算
//         ..[13] = -size.height / 2 * math.sin(math.pi * (value - 0.5)) // 设置y轴平移距离，根据动画值计算
//         ..[6] = math.sin(math.pi * (value - 0.5)) // 设置z轴旋转角度，根据动画值计算
//         ..[9] = -math.sin(math.pi * (value - 0.5))); // 设置z轴旋转角度，根据动画值计算
//
//       textPainter.text = TextSpan(// 修改文本片段的内容为下一个数字
//         text: '${number + 1}',
//         style: textStyle,
//       );
//
//       textPainter.layout(); // 重新进行文本布局
//
//       textPainter.paint(canvas, textOffset); // 在变换后的画布上绘制文本
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true; // 返回true表示需要重绘
//   }
// }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SvgDrawingAnimation(
              SvgProvider.asset(
                  'assets/a.svg'),
              duration: const Duration(milliseconds: 100),
              curve: Curves.decelerate,
              repeats: true),
        ),
      ),
    );
  }
}
//
// class ScoreBoard extends StatefulWidget {
//   final int score;
//   final Color digitColor;
//   final double digitSize;
//
//   const ScoreBoard({
//     Key? key,
//     required this.score,
//     this.digitColor = Colors.white,
//     this.digitSize = 50,
//   }) : super(key: key);
//
//   @override
//   _ScoreBoardState createState() => _ScoreBoardState();
// }

// class _ScoreBoardState extends State<ScoreBoard>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );
//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     );
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: ScoreBoardPainter(
//         score: widget.score,
//         digitColor: widget.digitColor,
//         digitSize: widget.digitSize,
//         animationValue: _animation.value,
//       ),
//       size: Size(widget.digitSize * 4, widget.digitSize),
//     );
//   }
// }

// class _ScoreBoardState extends State<ScoreBoard>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//
//   // create a variable to store the current score
//   int currentScore = 0;
//
//   // create a variable to store the target score
//   int targetScore = 0;
//
//   // create a variable to store the initial vertical drag position
//   double initialPosition = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );
//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     );
//     // set the current and target score to the widget's score
//     currentScore = widget.score;
//     targetScore = widget.score;
//     // start the animation
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       // handle the vertical drag start event
//       onVerticalDragStart: (details) {
//         // stop the animation if it is running
//         if (_controller.isAnimating) {
//           _controller.stop();
//         }
//         // store the initial position of the drag
//         initialPosition = details.localPosition.dy;
//       },
//       // handle the vertical drag update event
//       onVerticalDragUpdate: (details) {
//         // get the current position of the drag
//         double currentPosition = details.localPosition.dy;
//         // calculate the difference between the initial and current position
//         double delta = currentPosition - initialPosition;
//         // if the difference is positive, it means the user is dragging down
//         if (delta > 0) {
//           // calculate the animation value based on the difference and the digit size
//           double animationValue = delta / widget.digitSize;
//           // clamp the animation value between 0 and 1
//           animationValue = math.min(animationValue, 1);
//           // set the animation value to the controller's value
//           _controller.value = animationValue;
//           // if the animation value is close to 1, it means the user has dragged enough to change the score
//           if (animationValue > 0.9) {
//             // decrease the target score by one and wrap it around if it goes below zero
//             targetScore = (targetScore - 1) % 100;
//             // reset the initial position to the current position
//             initialPosition = currentPosition;
//             // reset the controller's value to zero
//             _controller.value = 0;
//           }
//         }
//         // if the difference is negative, it means the user is dragging up
//         else if (delta < 0) {
//           // calculate the animation value based on the difference and the digit size
//           double animationValue = -delta / widget.digitSize;
//           // clamp the animation value between 0 and 1
//           animationValue = math.min(animationValue, 1);
//           // set the animation value to the controller's value
//           _controller.value = animationValue;
//           // if the animation value is close to one, it means the user has dragged enough to change the score
//           if (animationValue > 0.9) {
//             // increase the target score by one and wrap it around if it goes above ninety-nine
//             targetScore = (targetScore + 1) % 100;
//             // reset the initial position to the current position
//             initialPosition = currentPosition;
//             // reset the controller's value to zero
//             _controller.value = 0;
//           }
//         }
//       },
//       // handle the vertical drag end event
//       onVerticalDragEnd: (details) {
//         // set the current score to the target score
//         currentScore = targetScore;
//         // animate the controller to one
//         _controller.animateTo(1);
//       },
//       child: CustomPaint(
//         painter: ScoreBoardPainter(
//           score: currentScore,
//           digitColor: widget.digitColor,
//           digitSize: widget.digitSize,
//           animationValue: _animation.value,
//         ),
//         size: Size(widget.digitSize * 2, widget.digitSize),
//       ),
//     );
//   }
// }
//
// class ScoreBoardPainter extends CustomPainter {
//   final int score;
//   final Color digitColor;
//   final double digitSize;
//   final double animationValue;
//
//   ScoreBoardPainter({
//     required this.score,
//     required this.digitColor,
//     required this.digitSize,
//     required this.animationValue,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     // get the digits of the score as a list of strings
//     List<String> digits = score.toString().padLeft(4, '0').split('');
//
//     // create a paint object for the digits
//     Paint digitPaint = Paint()
//       ..color = digitColor
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = digitSize / 10;
//
//     // create a path for each digit and draw it on the canvas
//     for (int i = 0; i < digits.length; i++) {
//       Path digitPath = getDigitPath(digits[i], i);
//       canvas.drawPath(digitPath, digitPaint);
//     }
//   }
//
//   // get the path for a single digit based on its value and position
//   Path getDigitPath(String value, int position) {
//     // create a path object
//     Path path = Path();
//
//     // get the center point of the digit
//     double centerX = position * digitSize + digitSize / 2;
//     double centerY = digitSize / 2;
//
//     // get the radius of the circle that forms the digit
//     double radius = digitSize / 3;
//
//     // get the angle of rotation for the animation
//     double angle = math.pi * animationValue;
//
//     // get the start and end points of the upper and lower arcs
//     Offset upperStart =
//     Offset(centerX - radius * math.cos(angle), centerY - radius * math.sin(angle));
//     Offset upperEnd =
//     Offset(centerX + radius * math.cos(angle), centerY - radius * math.sin(angle));
//     Offset lowerStart =
//     Offset(centerX - radius * math.cos(angle), centerY + radius * math.sin(angle));
//     Offset lowerEnd =
//     Offset(centerX + radius * math.cos(angle), centerY + radius * math.sin(angle));
//
//     // get the control points of the upper and lower arcs
//     Offset upperControl1 =
//     Offset(centerX - radius, centerY - radius * math.tan(angle / 2));
//     Offset upperControl2 =
//     Offset(centerX + radius, centerY - radius * math.tan(angle / 2));
//     Offset lowerControl1 =
//     Offset(centerX - radius, centerY + radius * math.tan(angle / 2));
//     Offset lowerControl2 =
//     Offset(centerX + radius, centerY + radius * math.tan(angle / 2));
//
//     // move the path to the upper start point
//     path.moveTo(upperStart.dx, upperStart.dy);
//
//     // draw the upper arc
//     path.cubicTo(
//       upperControl1.dx,
//       upperControl1.dy,
//       upperControl2.dx,
//       upperControl2.dy,
//       upperEnd.dx,
//       upperEnd.dy,
//     );
//
//     // draw the right line
//     if (value != '1' && value != '4') {
//       path.lineTo(lowerEnd.dx, lowerEnd.dy);
//     }
//
//     // draw the lower arc
//     path.cubicTo(
//       lowerControl2.dx,
//       lowerControl2.dy,
//       lowerControl1.dx,
//       lowerControl1.dy,
//       lowerStart.dx,
//       lowerStart.dy,
//     );
//
//     // draw the left line
//     if (value != '1' && value != '2' && value != '3' && value != '7') {
//       path.lineTo(upperStart.dx, upperStart.dy);
//     }
//
//     // draw the middle line
//     if (value == '0' ||
//         value == '2' ||
//         value == '3' ||
//         value == '4' ||
//         value == '5' ||
//         value == '6' ||
//         value == '8' ||
//         value == '9') {
//       path.moveTo(
//         centerX - radius * math.sin(angle),
//         centerY - radius * math.cos(angle),
//       );
//       path.lineTo(
//         centerX + radius * math.sin(angle),
//         centerY + radius * math.cos(angle),
//       );
//     }
//
//     // return the path
//     return path;
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }

// class Scoreboard extends StatefulWidget {
//   final int score;
//
//   const Scoreboard({required this.score});
//
//   @override
//   _ScoreboardState createState() => _ScoreboardState();
// }
//
// class _ScoreboardState extends State<Scoreboard>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   late int _lastScore;
//
//   @override
//   void initState() {
//     super.initState();
//     _lastScore = widget.score;
//     _controller =
//         AnimationController(duration: Duration(milliseconds: 500), vsync: this);
//     _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
//       ..addListener(() {
//         setState(() {});
//       });
//   }
//
//   @override
//   void didUpdateWidget(covariant Scoreboard oldWidget) {
//     if (oldWidget.score != widget.score) {
//       _lastScore = oldWidget.score;
//       _controller.reset();
//       _controller.forward();
//     }
//     super.didUpdateWidget(oldWidget);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             '${_lastScore.toInt()}',
//             style: TextStyle(fontSize: 24),
//           ),
//           SizedBox(width: 8),
//           Transform.translate(
//             offset: Offset(0, -50 * (1 - _animation.value)),
//             child: Text(
//               '${widget.score}',
//               style: TextStyle(fontSize: 24),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter Demo'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'Current counter value: ${_counter}',
//               ),
//               Transform.translate(
//                 offset: Offset(0.0, -1.0 * _counter * 100.0),
//                 child: Text(
//                   '${_counter}',
//                 ),
//               ),
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: _incrementCounter,
//           tooltip: 'Increment',
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }



// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
//   // create an animation controller
//   late AnimationController _controller;
//
//   // create an animation
//   late Animation<double> _animation;
//
//   List<List<Offset>> _strokes = [];
//
//   @override
//   void initState() {
//     super.initState();
//
//     // initialize the animation controller
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );
//
//     // initialize the animation
//     _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
//   }
//
//   @override
//   void dispose() {
//     // dispose the animation controller
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.black,
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // create a text field to input the character
//               TextField(
//                 style: TextStyle(color: Colors.white, fontSize: 24),
//                 textAlign: TextAlign.center,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: '请输入一个汉字',
//                   hintStyle: TextStyle(color: Colors.white54),
//                 ),
//                 // handle the text field's change event
//                 onChanged: (value) {
//                   // get the value of the text field as the character
//                   String character = value;
//
//                   // get the character code
//                   int code = character.codeUnitAt(0);
//
//                   // create an empty list to store the strokes
//                   List<List<Offset>> strokes = [];
//
//                   // loop through the character code bits from left to right
//                   for (int i = 15; i >= 0; i--) {
//                     // get the current bit value
//                     int bit = (code >> i) & 1;
//
//                     // calculate the x and y coordinates for the current bit
//                     double x = (15 - i) * 10.0 + 100.0 - 75.0;
//                     double y = 100.0;
//
//                     // create an offset object for the current bit position
//                     Offset offset = Offset(x, y);
//
//                     // if the bit is 1, add the offset to the last stroke
//                     if (bit == 1) {
//                       strokes.last.add(offset);
//                     } else {
//                       // if the bit is 0, create a new stroke and add the offset
//                       strokes.add([offset]);
//                     }
//                   }
//
//                   // update the state with the new strokes data
//                   setState(() {
//                     _strokes = strokes;
//                   });
//
//                   // reset and start the animation controller
//                   _controller.reset();
//                   _controller.forward();
//                 },
//               ),
//               SizedBox(height: 20),
//               // create an animated builder to display the strokes with animation
//               AnimatedBuilder(
//                 animation: _animation,
//                 builder: (context, child) {
//                   return CustomPaint(
//                     painter:
//                     StrokesPainter(strokes: _strokes, progress: _animation.value),
//                     size: Size(200, 200),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class StrokesPainter extends CustomPainter {
//   final List<List<Offset>> strokes;
//   final double progress;
//
//   StrokesPainter({required this.strokes, required this.progress});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     // create a paint object for the strokes
//     Paint strokePaint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 5;
//
//     // loop through the strokes and create a path for each stroke
//     for (List<Offset> stroke in strokes) {
//       // create a path object
//       Path path = Path();
//
//       // move the path to the first offset of the stroke
//       path.moveTo(stroke.first.dx, stroke.first.dy);
//
//       // loop through the rest of the offsets and draw lines to them with progress factor
//       for (int i = 1; i < stroke.length; i++) {
//         double dx = lerpDouble(stroke[i - 1].dx, stroke[i].dx, progress) ?? 0.0;
//         double dy = lerpDouble(stroke[i - 1].dy, stroke[i].dy, progress) ?? 0.0;
//         path.lineTo(dx, dy);
//       }
//
//       // draw the path on the canvas with the stroke paint
//       canvas.drawPath(path, strokePaint);
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }




//
// class MyApp extends StatelessWidget {
//
//   final List<String> _strokes = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.black,
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // create a text field to input the character
//               TextField(
//                 style: TextStyle(color: Colors.white, fontSize: 24),
//                 textAlign: TextAlign.center,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: '请输入一个汉字',
//                   hintStyle: TextStyle(color: Colors.white54),
//                 ),
//                 // handle the text field's change event
//                 onChanged: (value) {
//                   // get the value of the text field as the character
//                   String character = value;
//
//                   // get the strokes data for the character from an external api
//                   fetch('https://www.hanziapi.com/api/strokes/$character')
//                       .then((response) => response.json())
//                       .then((data) {
//                     // get the strokes data as a list of strings
//                     List<String> strokes = data['strokes'];
//
//                     // update the state with the new strokes data
//                     // setState(() {
//                     //   _strokes = strokes;
//                     // });
//                   });
//                 },
//               ),
//               SizedBox(height: 20),
//               // create a custom paint to display the strokes
//               CustomPaint(
//                 painter: StrokesPainter(strokes: _strokes),
//                 size: Size(200, 200),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class StrokesPainter extends CustomPainter {
//   final List<String> strokes;
//
//   StrokesPainter({required this.strokes});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     // create a paint object for the strokes
//     Paint strokePaint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 5;
//
//     // loop through the strokes and create a path for each stroke
//     for (String stroke in strokes) {
//       // create a path object
//       Path path = Path();
//
//       // split the stroke by spaces and get the commands and parameters
//       List<String> commands = stroke.split(' ');
//
//       // loop through the commands and handle each command
//       for (String command in commands) {
//         // get the first character of the command as the type
//         String type = command[0];
//
//         // get the rest of the command as the parameters
//         String parameters = command.substring(1);
//
//         // split the parameters by commas and convert them to numbers
//         List<double> numbers =
//         parameters.split(',').map(double.parse).toList();
//
//         // handle each type of command
//         switch (type) {
//           case 'M':
//           // move the path to a point
//             path.moveTo(numbers[0], numbers[1]);
//             break;
//           case 'L':
//           // draw a line to a point
//             path.lineTo(numbers[0], numbers[1]);
//             break;
//           case 'Q':
//           // draw a quadratic bezier curve to a point
//             path.quadraticBezierTo(
//                 numbers[0], numbers[1], numbers[2], numbers[3]);
//             break;
//           case 'C':
//           // draw a cubic bezier curve to a point
//             path.cubicTo(numbers[0], numbers[1], numbers[2], numbers[3],
//                 numbers[4], numbers[5]);
//             break;
//           case 'Z':
//           // close the path
//             path.close();
//             break;
//           default:
//           // ignore any other command
//             break;
//         }
//       }
//
//       // draw the path on the canvas with the stroke paint
//       canvas.drawPath(path, strokePaint);
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }





// class NumberFlipDemo extends StatefulWidget {
//   const NumberFlipDemo({Key? key}) : super(key: key);
//
//   @override
//   _NumberFlipDemoState createState() => _NumberFlipDemoState();
// }
//
// class _NumberFlipDemoState extends State<NumberFlipDemo>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller; // 动画控制器
//   late Animation<double> _animation; // 动画对象
//   int _number = 0; // 数字的初始值
//   double _startY = 0.0; // 手势开始时的纵坐标
//   double _endY = 0.0; // 手势结束时的纵坐标
//
//   @override
//   void initState() {
//     super.initState();
//     // 初始化动画控制器，设置动画时长为1秒
//     _controller = AnimationController(
//       duration: const Duration(seconds: 1),
//       vsync: this,
//     );
//     // 初始化动画对象，设置范围为0到pi/2
//     _animation = Tween<double>(begin: 0, end: math.pi / 2).animate(_controller);
//   }
//
//   @override
//   void dispose() {
//     // 销毁动画控制器
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('数字上下翻滚示例'),
//       ),
//       body: Center(
//         child: GestureDetector(
//           onVerticalDragStart: (details) {
//             // 记录手势开始时的纵坐标
//             _startY = details.localPosition.dy;
//           },
//           onVerticalDragUpdate: (details) {
//             // 记录手势移动时的纵坐标
//             _endY = details.localPosition.dy;
//           },
//           onVerticalDragEnd: (details) {
//             // 计算手势移动的距离
//             double distance = _endY - _startY;
//             // 如果距离大于10像素，就增加数字的值，并启动动画
//             if (distance > 10) {
//               setState(() {
//                 _number++;
//               });
//               _controller.forward(from: 0);
//             }
//             // 如果距离小于-10像素，就减少数字的值，并启动动画
//             if (distance < -10) {
//               setState(() {
//                 _number--;
//               });
//               _controller.forward(from: 0);
//             }
//           },
//           child: AnimatedBuilder(
//             animation: _animation,
//             builder: (context, child) {
//               return Transform(
//                 alignment: Alignment.bottomCenter,
//                 transform: Matrix4.identity()
//                   ..setEntry(3, 2, 0.001)
//                   ..rotateX(_animation.value),
//                 child: child,
//               );
//             },
//             child: Text(
//               '$_number',
//               style: TextStyle(fontSize: 200, color: Colors.blue),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




// class NumberGestureDemo extends StatefulWidget {
//   const NumberGestureDemo({Key? key}) : super(key: key);
//
//   @override
//   _NumberGestureDemoState createState() => _NumberGestureDemoState();
// }
//
// class _NumberGestureDemoState extends State<NumberGestureDemo> {
//   int _number = 0; // 数字的初始值
//   double _startY = 0.0; // 手势开始时的纵坐标
//   double _endY = 0.0; // 手势结束时的纵坐标
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('数字手势上下滑动示例'),
//       ),
//       body: Center(
//         child: GestureDetector(
//           onVerticalDragStart: (details) {
//             // 记录手势开始时的纵坐标
//             _startY = details.localPosition.dy;
//           },
//           onVerticalDragUpdate: (details) {
//             // 记录手势移动时的纵坐标
//             _endY = details.localPosition.dy;
//           },
//           onVerticalDragEnd: (details) {
//             // 计算手势移动的距离
//             double distance = _endY - _startY;
//             // 如果距离大于10像素，就增加数字的值
//             if (distance > 10) {
//               setState(() {
//                 _number++;
//               });
//             }
//             // 如果距离小于-10像素，就减少数字的值
//             if (distance < -10) {
//               setState(() {
//                 _number--;
//               });
//             }
//           },
//           child: Stack(
//             children: [
//               Icon(Icons.notifications, size: 100),
//               Align(
//                 alignment: Alignment.topRight,
//                 child: Text(
//                   '$_number',
//                   style: TextStyle(fontSize: 24, color: Colors.red),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter Expanded Demo'),
//         ),
//         body: Center(
//           child: Column( // 使用Column小部件来创建一个垂直方向的布局
//             children: [
//               Expanded( // 使用Expanded小部件来包裹第一个子组件
//                 flex: 2, // 设置flex为2
//                 child: Container( // 使用容器作为子组件
//                   color: Colors.red, // 设置容器的颜色为红色
//                   child: Center( // 在容器中居中显示一个文字
//                     child: Text(
//                       'One',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded( // 使用Expanded小部件来包裹第二个子组件
//                 flex: 1, // 设置flex为1
//                 child: Row( // 使用Row小部件来创建一个水平方向的布局
//                   children: [
//                     Expanded( // 使用Expanded小部件来包裹第一个子组件
//                       flex: 1, // 设置flex为1
//                       child: Container( // 使用容器作为子组件
//                         color: Colors.green, // 设置容器的颜色为绿色
//                         child: Center( // 在容器中居中显示一个文字
//                           child: Text(
//                             'Two',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded( // 使用Expanded小部件来包裹第二个子组件
//                       flex: 2, // 设置flex为2
//                       child: Container( // 使用容器作为子组件
//                         color: Colors.blue, // 设置容器的颜色为蓝色
//                         child: Center( // 在容器中居中显示一个文字
//                           child: Text(
//                             'Three',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded( // 使用Expanded小部件来包裹第三个子组件
//                 flex: 1, // 设置flex为1
//                 child: Container( // 使用容器作为子组件
//                   color: Colors.yellow, // 设置容器的颜色为黄色
//                   child: Center( // 在容器中居中显示一个文字
//                     child: Text(
//                       'Four',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
