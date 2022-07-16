import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '011_pattern_mvc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: '011 MVC'),
    );
  }
}

/// Avoid to use StatefulWidget when the view has not global state.
class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final CountPointerController controller = CountPointerController(0);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: CountPointer(
                controller: controller,
                style: const TextStyle(fontSize: 50),
                // valueChanged: (value) {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.add();
                  },
                  child: const Text("Add"),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.plus();
                  },
                  child: const Text("Plus"),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.reset();
                  },
                  child: const Text("Reset"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

/// C of pattern MVC, the 'int' who controller value is M of pattern MVC
class CountPointerController extends ValueNotifier<int> {
  CountPointerController(super.value);

  /// Just add 1
  add() {
    value = value + 1;
  }

  /// Just plus 1
  plus() {
    value = value - 1;
  }

  /// Reset to 0.
  reset() {
    value = 0;
  }
}

/// Just a Counter.   V of pattern MVC
class CountPointer extends StatefulWidget {
  const CountPointer({
    Key? key,
    this.controller,
    this.valueChanged,
    TextStyle? style,
  })  : style = style ?? const TextStyle(fontSize: 60),
        super(key: key);

  final CountPointerController? controller;
  final ValueChanged<int>? valueChanged;
  final TextStyle? style;

  @override
  State<CountPointer> createState() => _CountPointerState();
}

class _CountPointerState extends State<CountPointer> {
  RestorableCountPointController? _controller;

  CountPointerController get _effectController => widget.controller ?? _controller!.value;

  @override
  void dispose() {
    _controller?.dispose();
    _effectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _effectController,
      builder: (context, value, child) {
        widget.valueChanged?.call(value);
        return Text(
          "$value",
          style: widget.style?.copyWith(color: value < 0 ? Colors.redAccent : Colors.black87),
        );
      },
    );
  }
}

///
class RestorableCountPointController extends RestorableChangeNotifier<CountPointerController> {
  final int _initValue = 0;

  @override
  CountPointerController createDefaultValue() {
    return CountPointerController(_initValue);
  }

  @override
  CountPointerController fromPrimitives(Object? data) {
    return CountPointerController(data! as int);
  }

  @override
  Object? toPrimitives() {
    return value.value;
  }
}
