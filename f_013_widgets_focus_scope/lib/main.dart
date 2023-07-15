import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "f_013_widgets_focus_scope",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("013 FocusScope"),
        ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

/// A demonstration pane.
///
/// This is just a separate widget to simplify the example.
class Pane extends StatelessWidget {
  const Pane({
    Key? key,
    required this.focusNode,
    this.onPressed,
    required this.backgroundColor,
    required this.icon,
    this.child,
  }) : super(key: key);

  final FocusNode focusNode;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Widget icon;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Center(
            child: child,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              autofocus: true,
              focusNode: focusNode,
              onPressed: onPressed,
              icon: icon,
            ),
          ),
        ],
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool backdropIsVisible = false;
  FocusNode backdropNode = FocusNode(debugLabel: 'Close Backdrop Button');
  FocusNode foregroundNode = FocusNode(debugLabel: 'Option Button');

  @override
  void dispose() {
    backdropNode.dispose();
    foregroundNode.dispose();
    super.dispose();
  }

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    final Size stackSize = constraints.biggest;
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        FocusScope(
          canRequestFocus: backdropIsVisible,
          child: Pane(
            icon: const Icon(Icons.close),
            focusNode: backdropNode,
            backgroundColor: Colors.lightBlue,
            onPressed: () => setState(() => backdropIsVisible = false),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => debugPrint('You pressed the other button!'),
                  child: const Text('ANOTHER BUTTON TO FOCUS'),
                ),
                DefaultTextStyle(style: Theme.of(context).textTheme.headline2!, child: const Text('BACKDROP')),
              ],
            ),
          ),
        ),
        AnimatedPositioned(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 300),
          top: backdropIsVisible ? stackSize.height * 0.9 : 0.0,
          width: stackSize.width,
          height: stackSize.height,
          onEnd: () {
            if (backdropIsVisible) {
              backdropNode.requestFocus();
            } else {
              foregroundNode.requestFocus();
            }
          },
          child: Pane(
            icon: const Icon(Icons.menu),
            focusNode: foregroundNode,
            backgroundColor: Colors.green,
            onPressed: backdropIsVisible ? null : () => setState(() => backdropIsVisible = true),
            child: DefaultTextStyle(style: Theme.of(context).textTheme.headline2!, child: const Text('FOREGROUND')),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: _buildStack);
  }
}
