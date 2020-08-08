import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plume/widget/block.dart';

class WrapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("002 Wrap")),
      body: SafeArea(
        child: _WrapStatePage(),
      ),
    );
  }
}

class _WrapStatePage extends StatefulWidget {
  @override
  _WrapState createState() => _WrapState();
}

class _WrapState extends State<_WrapStatePage> {
  Widget block({Color color, double width, double height}) {
    return Container(
      color: color ?? Colors.lightBlueAccent,
      width: width ?? 80,
      height: height ?? 80,
      child: Text(""),
    );
  }

  List<Widget> children() {
    return [
      block(color: Colors.tealAccent, width: 120, height: 80),
      block(),
      block(color: Colors.green),
      block(color: Colors.red),
      block(color: Colors.lightGreenAccent, height: 200),
      block(height: 200, width: 80),
      block(color: Colors.lightGreenAccent, height: 200),
      block(height: 200, color: Colors.lightGreenAccent),
      block(color: Colors.red, height: 200),
      block(height: 200),
      block(color: Colors.green, height: 200),
      block(width: 100),
      block(width: 100, height: 150, color: Colors.pinkAccent),
      Block(title: "1",)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        color: Colors.grey,
        width: double.infinity,
        padding: EdgeInsets.all(5.0),
        child: Wrap(
//        child: Row(
          spacing: 5.0,
          // 列间距
          runSpacing: 5.0,
          // 行间距
          crossAxisAlignment: WrapCrossAlignment.end,
          direction: Axis.horizontal,
          children: children(),
//        ),
        ),
      ),
    );
  }
}

/////
///// Block Container
/////
//class Block extends StatelessWidget {
//  Block({Key key, this.width = 80.0, this.height = 80.0, this.title = "", this.color = Colors.blueAccent}) : super(key: key);
//
//  ///
//  /// 宽
//  ///
//  final double width;
//
//  ///
//  /// 高
//  ///
//  final double height;
//
//  ///
//  /// 标题
//  ///
//  final String title;
//
//  ///
//  /// 背景色
//  ///
//  final Color color;
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      color: color,
//      width: width,
//      height: height,
//      child: Center(
//          child: Text(
//        title,
//        style: TextStyle(color: Colors.black, fontStyle: FontStyle.normal),
//      )),
//    );
//  }
//}
