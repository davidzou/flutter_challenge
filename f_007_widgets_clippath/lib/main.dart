import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plume/widget/block.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<String, String> env = Platform.environment;
    env.forEach((k, v) => print("Key=$k Value=$v"));
    return MaterialApp(
      title: 'f_007_widgets_clippath',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '007 ClipPath'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: ClipPath(
            clipper: CustomCLip(),
            child: Block(
              color: Colors.blue,
              width: 300,
              height: 300,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CustomCLip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // path.shift(Offset(10, 10));
    // 从 60，0 开始
    path.moveTo(60, 0);
    // 二阶贝塞尔曲线画弧
    path.quadraticBezierTo(0, 0, 0, 60);
    // 连接到底部
    path.lineTo(0, size.height / 1.2);
    // 三阶贝塞尔曲线画弧
    path.cubicTo(
        size.width / 4, size.height, size.width / 4 * 3, size.height / 1.5,
        size.width, size.height / 1.2);
    // 再连接回去
    path.lineTo(size.width, 60);
    // 再用二阶贝塞尔曲线画弧
    path.quadraticBezierTo(size.width - 60, 60, size.width - 60, 0);

    path.moveTo(9, 80);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<dynamic> oldClipper) {
    return true;
  }

}

class Clip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 20,
      color: Colors.red,
    );
  }
}
