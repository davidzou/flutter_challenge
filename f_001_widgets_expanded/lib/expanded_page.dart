import 'package:flutter/material.dart';
import 'package:plume/widget/block.dart';
import 'package:plume/widget/head.dart';

class ExpandedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("001 Expanded"),
      ),
      body: SafeArea(
        child: _ExpandedStatePage(),
      ),
    );
  }
}

class _ExpandedStatePage extends StatefulWidget {
  @override
  _ExpandedState createState() => _ExpandedState();
}

class _ExpandedState extends State<_ExpandedStatePage> {
  bool enableGreenExpanded = false;
  bool enableBlueExpanded = false;
  bool enableRedExpanded = false;

  int redFlex = 0;
  int greenFlex = 0;
  int blueFlex = 0;

  Widget block(Color color) {
    return Tooltip(
      message: "$color",
      child: Block(
        color: color,
      ),
    );
  }

  Widget expandedBlock(Color color) {
    return Expanded(
      child: block(color),
    );
  }

  Widget expandedFlexBlock(int flex, Color color) {
    return Expanded(

      flex: flex,
      child: block(color),
    );
  }

  @override
  void initState() {
    super.initState();
    enableRedExpanded = false;
    enableGreenExpanded = false;
    enableBlueExpanded = false;
    redFlex = 1;
    greenFlex = 1;
    blueFlex = 1;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          HeadTitle("Expanded to be used."),
          SwitchListTile(
            title: Text("Red"),
            value: enableRedExpanded,
            onChanged: (bool onChanged) {
              setState(() {
                enableRedExpanded = onChanged;
              });
            },
          ),
          SwitchListTile(
            title: Text("Green"),
            value: enableGreenExpanded,
            onChanged: (bool onChanged) {
              setState(() {
                enableGreenExpanded = onChanged;
              });
            },
          ),
          SwitchListTile(
            title: Text("Blue"),
            value: enableBlueExpanded,
            onChanged: (bool onChanged) {
              setState(() {
                enableBlueExpanded = onChanged;
              });
            },
          ),
          Container(
            color: Colors.tealAccent,
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                enableRedExpanded ? expandedBlock(ExpandedStyle.red) : block(ExpandedStyle.red),
                enableGreenExpanded ? expandedBlock(ExpandedStyle.green) : block(ExpandedStyle.green),
                enableBlueExpanded ? expandedBlock(ExpandedStyle.blue) : block(ExpandedStyle.blue),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          HeadTitle("Expanded by flex value."),
          LabelCount(
            "RED",
            start: redFlex,
            onChanged: (value) {
              setState(() {
                redFlex = value;
              });
            },
          ),
          LabelCount(
            "GREEN",
            start: greenFlex,
            onChanged: (value) {
              setState(() {
                greenFlex = value;
              });
            },
          ),
          LabelCount(
            "BLUE",
            start: blueFlex,
            onChanged: (value) {
              setState(() {
                blueFlex = value;
              });
            },
          ),
          Container(
            color: Colors.tealAccent,
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                expandedFlexBlock(redFlex, ExpandedStyle.red),
                expandedFlexBlock(greenFlex, ExpandedStyle.green),
                expandedFlexBlock(blueFlex, ExpandedStyle.blue),
              ],
            ),
          )
        ],
      ),
    );
  }
}

typedef LabelCountChanged = void Function(int value);

///
/// +----------------------------------------+
/// | label                           + 0 -  |
/// +----------------------------------------+
///
class LabelCount extends StatefulWidget {
  LabelCount(
    this.label, {
    Key? key,
    this.start = 0,
    this.onChanged,
    this.padding,
  }) : super(key: key);

  /// 标签字符
  final String label;

  /// 起始值
  final int start;

  ///
  final LabelCountChanged? onChanged;

  final EdgeInsetsGeometry? padding;

  @override
  _LabelCountState createState() => _LabelCountState();
}

class _LabelCountState extends State<LabelCount> {
  int count = 0;

  update(bool add) {
    setState(() {
      if (add) {
        count++;
      } else {
        count > 0 ? count-- : count = 0;
      }
    });
    widget.onChanged?.call(this.count);
  }

  Widget countWidget() {
    return Container(
      padding: widget.padding ?? EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(widget.label),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              update(true);
            },
          ),
          Text("$count"),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              update(false);
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    count = widget.start;
  }

  @override
  Widget build(BuildContext context) {
    return countWidget();
  }
}

///
/// 样式
///
class ExpandedStyle {
  static const Color googleBlue = Color(0xff2d85f0);

  static const Color red = Color(0xffff0000);

  static const Color green = Color(0xff00ff00);

  static const Color blue = Color(0xff0000ff);
}
