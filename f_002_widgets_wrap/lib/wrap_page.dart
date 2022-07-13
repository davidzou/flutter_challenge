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

  List<Widget> children() {
    return [
      Block(color: Colors.tealAccent, width: 120, height: 80),
      Block(),
      Block(color: Colors.green),
      Block(color: Colors.red),
      Block(color: Colors.lightGreenAccent, height: 200),
      Block(height: 200, width: 80),
      Block(color: Colors.lightGreenAccent, height: 200),
      Block(height: 200, color: Colors.lightGreenAccent),
      Block(color: Colors.red, height: 200),
      Block(height: 200),
      Block(color: Colors.green, height: 200),
      Block(width: 100),
      Block(width: 100, height: 150, color: Colors.pinkAccent),
      Block(title: "我被换行了",)
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