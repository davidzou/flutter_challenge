import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '\'Directionality\' of Widgets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '\'Directionality\' of Widgets'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const String text0 = "abc,defg,ABCD,EFG,";
const String text1 = "123456789.0, he ] was";
const String text2 = "来点中文 ，看看";

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
      body: Stack(
        children: [
          const Positioned(
            left: 0,
            right: 0,
            top: 1,
            child: Center(child: Text("origin : $text1")),
          ),
          Directionality(
            textDirection: _counter % 2 == 0 ? TextDirection.ltr : TextDirection.rtl,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(text0),
                  const Text(text1),
                  const Text(text2),
                  const SizedBox(height: 20),
                  Text(
                    _counter % 2 == 0 ? "TextDirection.ltr" : "TextDirection.rtl",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: _counter % 2 == 0 ? const Icon(Icons.align_horizontal_left) : const Icon(Icons.align_horizontal_right),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
