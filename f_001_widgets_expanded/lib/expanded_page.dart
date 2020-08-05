import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpandedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("001 Expanded"),
      ),
      body: SafeArea(
        child: Container(
          child: _ExpandedStatePage(),
        ),
      ),
    );
  }
}

class _ExpandedStatePage extends StatefulWidget {
  @override
  _ExpandedState createState() => _ExpandedState();
}

class _ExpandedState extends State<_ExpandedStatePage> {
  bool enableGreenExpanded;
  bool enableBlueExpanded;
  bool enableRedExpanded;

  Widget block(Color color) {
    return Container(
      color: color,
      width: 80,
      height: 80,
      child: Text(""),
    );
  }

  Widget expandedBlock(Color color) {
    return Expanded(
      child: block(color),
    );
  }

  @override
  void initState() {
    super.initState();
    enableRedExpanded = false;
    enableGreenExpanded = false;
    enableBlueExpanded = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SwitchListTile(
          title: Text("Red Expanded"),
          value: enableRedExpanded,
          onChanged: (bool onChanged) {
            setState(() {
              enableRedExpanded = onChanged;
            });
          },
        ),
        SwitchListTile(
          title: Text("Green Expanded"),
          value: enableGreenExpanded,
          onChanged: (bool onChanged) {
            setState(() {
              enableGreenExpanded = onChanged;
            });
          },
        ),
        SwitchListTile(
          title: Text("Blue Expanded"),
          value: enableBlueExpanded,
          onChanged: (bool onChanged) {
            setState(() {
              enableBlueExpanded = onChanged;
            });
          },
        ),
        Container(
          child: Row(
            children: <Widget>[
              enableRedExpanded ? expandedBlock(Color(0xffff0000)) : block(Color(0xffff0000)),
              enableGreenExpanded ? expandedBlock(Color(0xff00ff00)) : block(Color(0xff00ff00)),
              enableBlueExpanded ? expandedBlock(Color(0xff0000ff)) : block(Color(0xff0000ff)),
            ],
          ),
        ),
      ],
    );
  }
}
