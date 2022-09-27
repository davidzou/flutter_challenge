import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '014 AboutDialog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '014 AboutDialog'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text(
            "Click About",
          ),
          onPressed: () {
            showAboutDialog(
              context: context,
              applicationName: "14 AboutDialog",
              applicationIcon: const FlutterLogo(),
              applicationVersion: "1.0.0",
              applicationLegalese: "xxx",
              children: [
                const Text("This is a demo for AboutDialog created by DavidZou."),
                // const Text("What!!!")
              ]
            );
          },
        ),
      ),
    );
  }
}
