import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    MaterialApp(
      title: "f_016_widgets_elevatedbutton",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const MyHomePage(
        title: "016 ElevatedButton",
      ),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 final TextEditingController _controller =  TextEditingController(text: "0");

  @override
  void initState() {
    super.initState();
    StateController.instance().addListener(_refresh);
  }

  @override
  void dispose() {
    StateController.instance().removeListener(_refresh);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                const Text("elevation: "),
                Slider(
                    value: StateController.instance().elevation ?? 0.0,
                    min: 0.0,
                    max: 64.0,
                    onChanged: (onChanged) {
                      StateController.instance().elevation = onChanged;
                    }),
                Text("${StateController.instance().elevation?.toInt()}"),
              ],
            ),
            Row(
              children: [
                const Text("padding: "),
                Slider(
                    value: StateController.instance().padding ?? 0.0,
                    min: 0.0,
                    max: 100.0,
                    onChanged: (onChanged) {
                      StateController.instance().padding = onChanged;
                    }),
                Text("${StateController.instance().padding?.toInt()}"),
              ],
            ),
            IntSetter(controller: _controller, onChanged: (count) { StateController.instance().radius = count.toDouble();},),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                elevation: MaterialStateProperty.resolveWith((states) => StateController.instance().elevation),
                padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.all(StateController.instance().padding ?? 0.0)),
                // side: MaterialStateProperty.resolveWith((states) => BorderSide(),),
                shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(StateController.instance().radius))),
              ),
              child: Text("Elevated${_controller.text}"),
            ),
          ],
        ),
      ),
    );
  }

  _refresh() {
    setState(() {});
  }
}

///
/// 数字设置
/// icon + 0 -
class IntSetter extends StatefulWidget {
  const IntSetter({
    Key? key,
    this.init,
    this.min,
    this.max,
    this.controller,
    this.label,
    this.icon,
    this.onChanged,
  }) : super(key: key);

  /// 初始值
  final int? init;

  /// 最小值
  final int? min;

  /// 最大值
  final int? max;

  /// 前缀标题，表明这个值是设置什么的
  final String? label;
  /// 前缀Logo，表明设置的值为什么。
  final IconData? icon;

  final TextEditingController? controller;

  final ValueChanged<int>? onChanged;

  @override
  State<IntSetter> createState() => _IntSetterState();
}

class _IntSetterState extends State<IntSetter> {
  int _count = 0;

  late final TextEditingController _controller;

  final maxNum = 99999;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.text = "$_count";
  }

  @override
  void didUpdateWidget(covariant IntSetter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller?.text != widget.controller?.text) {}
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(widget.icon ?? Icons.rounded_corner, color: Colors.grey, size: 18),
        Text(widget.label ?? ""),
        IconButton(
          onPressed: () {
            _controller.text = "${(widget.max ?? maxNum) > _count ? (_count += 1) : (widget.max ?? maxNum)}";
            widget.onChanged?.call(_count);
          },
          icon: const Icon(Icons.expand_less, color: Colors.grey, size: 18),
        ),
        IntrinsicWidth(
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(border: InputBorder.none),
            inputFormatters: [
              // 这里限定了数字长度，以及仅数字
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(maxNum.toString().length),
            ],
            onChanged: (text) {
            },
            onSubmitted: (text) {
              // 这里按回车后需要设置空和数值前缀为零的
              _count = int.parse(text.isEmpty ? "0" : text);
              _controller.text = "$_count";
              widget.onChanged?.call(_count);
            },
          ),
        ),
        IconButton(
          onPressed: () {
            _controller.text = "${(widget.min ?? 0) < _count ? (_count -= 1) : (widget.min ?? 0)}";
            widget.onChanged?.call(_count);
          },
          icon: const Icon(Icons.expand_more, color: Colors.grey, size: 18),
        ),
      ],
    );
  }
}

class StateController with ChangeNotifier {
  StateController._();

  static final StateController _instance = StateController._();

  factory StateController.instance() => _instance;

  // this.textStyle,
  // this.backgroundColor,
  // this.foregroundColor,
  // this.overlayColor,
  // this.shadowColor,
  // this.surfaceTintColor,
  double? _elevation;

  double? get elevation => _elevation;

  set elevation(double? elevation) {
    _elevation = elevation;
    notifyListeners();
  }

  double? _padding;

  double? get padding => _padding;

  set padding(double? padding) {
    _padding = padding;
    notifyListeners();
  }

  double? _radius;
  double get radius => _radius ?? 0.0;
  set radius(double? radius) {
    _radius = radius;
    notifyListeners();
  }

// this.padding,
// this.minimumSize,
// this.fixedSize,
// this.maximumSize,
// this.side,
// this.shape,
// this.mouseCursor,
// this.visualDensity,
// this.tapTargetSize,
// this.animationDuration,
// this.enableFeedback,
// this.alignment,
// this.splashFactory,
}
