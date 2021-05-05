import 'package:flutter/material.dart';
import 'package:plume/widget/block.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Challenge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'f_005_widgets_opacity'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _opacity = 0;

  void _setOpacity() {
    setState(() {
      _opacity = (_opacity == 1.0) ? 0 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Block(color: Colors.green,),
            AnimatedOpacity(opacity: _opacity, duration: Duration(milliseconds: 500), child: Block(color: Colors.red,)),
            Block(color: Colors.blue)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _setOpacity,
        tooltip: 'Increment',
        child: Icon(Icons.track_changes),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
