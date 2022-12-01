import 'package:flutter/material.dart';
import 'package:plume/framework/container/drawer.dart';
import 'package:plume/widget/block.dart';

class WrapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("002 Wrap")),
      body: SafeArea(
        child: _WrapStatePage(),
      ),
      drawer: DrawerBuilder.drawer(
        context,
        delegate: DrawerChildListDelegate(children: [], footer: SafeArea(child: Text("v2.0.0"))),
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
      Block(
        color: Colors.tealAccent,
        width: 120,
        height: 80,
        title: "120*80",
      ),
      Block(
        title: "80*80",
      ),
      Block(
        color: Colors.green,
        title: "80*80",
      ),
      Block(
        color: Colors.red,
        title: "80*80",
      ),
      Block(
        color: Colors.lightGreenAccent,
        height: 200,
        title: "80*200",
      ),
      Block(height: 200, width: 80),
      Block(color: Colors.lightGreenAccent, height: 200),
      Block(height: 200, color: Colors.lightGreenAccent),
      Block(color: Colors.red, height: 200),
      Block(height: 200),
      Block(color: Colors.green, height: 200),
      Block(width: 100),
      Block(width: 100, height: 150, color: Colors.pinkAccent),
      Block(
        title: "我被换行了",
      )
    ];
  }

  @override
  void initState() {
    super.initState();
    WrapNotifier.own().addListener(_refresh);
  }

  @override
  void dispose() {
    WrapNotifier.own().removeListener(_refresh);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Text("space"), flex: 1),
                  Expanded(
                      child: Slider(
                        value: WrapNotifier.own().spacing,
                        min: 0.0,
                        max: 50.0,
                        onChanged: (value) {
                          WrapNotifier.own().spacing = value.roundToDouble();
                        },
                      ),
                      flex: 3),
                  Text("${WrapNotifier.own().spacing}"),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text("runSpace"), flex: 1),
                  Expanded(
                      child: Slider(
                        value: WrapNotifier.own().runSpacing,
                        min: 0.0,
                        max: 50.0,
                        onChanged: (value) {
                          WrapNotifier.own().runSpacing = value.roundToDouble();
                        },
                      ),
                      flex: 3),
                  Text("${WrapNotifier.own().runSpacing}"),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              color: Colors.grey,
              width: double.infinity,
              child: Wrap(
                spacing: WrapNotifier.own().spacing,
                // 列间距
                runSpacing: WrapNotifier.own().runSpacing,
                // 行间距
                crossAxisAlignment: WrapCrossAlignment.end,
                direction: Axis.horizontal,
                children: children(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _refresh() {
    setState(() {});
  }
}

class WrapNotifier with ChangeNotifier {
  WrapNotifier._();

  static WrapNotifier _instance = WrapNotifier._();

  factory WrapNotifier.own() => _instance;

  double? _spacing;
  double? _runSpacing;

  double get spacing => _spacing ?? 0.0;

  set spacing(double spacing) {
    _spacing = spacing;
    notifyListeners();
  }

  double get runSpacing => _runSpacing ?? 0.0;

  set runSpacing(double runSpacing) {
    _runSpacing = runSpacing;
    notifyListeners();
  }
}
