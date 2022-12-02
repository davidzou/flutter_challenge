import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'f_010_widgets_textfield',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '010 TextField'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller1 = TextEditingController(text: "");
  final TextEditingController _controller2 = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    TextFieldNotifier.instance().addListener(_refresh);
  }

  @override
  void dispose() {
    TextFieldNotifier.instance().removeListener(_refresh);
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controller1,
                decoration: InputDecoration(
                  border: TextFieldNotifier.instance().inputBorder,
                  hintText: "Hint",
                  labelText: "Label",
                ),
                obscureText: TextFieldNotifier.instance().obscureText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controller2,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Hint",
                  label: Text("Label"),
                ),
                obscureText: TextFieldNotifier.instance().obscureText,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            SwitchListTile(
              title: const Text("obscureText(加密文字)"),
              value: TextFieldNotifier.instance().obscureText,
              onChanged: (value) {
                TextFieldNotifier.instance().obscureText = value;
              },
            ),
            RadioListTile<InputBorder>(
              title: const Text("UnderlineInputBorder"),
              value: const UnderlineInputBorder(),
              groupValue: TextFieldNotifier.instance().inputBorder,
              onChanged: (value) {
                TextFieldNotifier.instance().inputBorder = value!;
              },
            ),
            RadioListTile<InputBorder>(
              title: const Text("OutlineInputBorder"),
              value: const OutlineInputBorder(),
              groupValue: TextFieldNotifier.instance().inputBorder,
              onChanged: (value) {
                TextFieldNotifier.instance().inputBorder = value!;
              },
            ),
          ],
        ),
      ),
    );
  }

  _refresh() {
    setState(() {});
  }

// this.controller,
// this.focusNode,
// this.decoration = const InputDecoration(),
// TextInputType? keyboardType,
// this.textInputAction,
// this.textCapitalization = TextCapitalization.none,
// this.style,
// this.strutStyle,
// this.textAlign = TextAlign.start,
// this.textAlignVertical,
// this.textDirection,
// this.readOnly = false,
// ToolbarOptions? toolbarOptions,
// this.showCursor,
// this.autofocus = false,
// this.obscuringCharacter = '•',
// this.obscureText = false,
// this.autocorrect = true,
// SmartDashesType? smartDashesType,
//     SmartQuotesType? smartQuotesType,
// this.enableSuggestions = true,
// this.maxLines = 1,
// this.minLines,
// this.expands = false,
// this.maxLength,
// this.maxLengthEnforcement,
// this.onChanged,
// this.onEditingComplete,
// this.onSubmitted,
// this.onAppPrivateCommand,
// this.inputFormatters,
// this.enabled,
// this.cursorWidth = 2.0,
// this.cursorHeight,
// this.cursorRadius,
// this.cursorColor,
// this.selectionHeightStyle = ui.BoxHeightStyle.tight,
// this.selectionWidthStyle = ui.BoxWidthStyle.tight,
// this.keyboardAppearance,
// this.scrollPadding = const EdgeInsets.all(20.0),
// this.dragStartBehavior = DragStartBehavior.start,
// bool? enableInteractiveSelection,
// this.selectionControls,
// this.onTap,
// this.mouseCursor,
// this.buildCounter,
// this.scrollController,
// this.scrollPhysics,
// this.autofillHints = const <String>[],
// this.clipBehavior = Clip.hardEdge,
// this.restorationId,
// this.scribbleEnabled = true,
// this.enableIMEPersonalizedLearning = true,
}

class TextFieldNotifier with ChangeNotifier {
  TextFieldNotifier._();

  static final TextFieldNotifier _instance = TextFieldNotifier._();

  factory TextFieldNotifier.instance() => _instance;

  bool? _obscureText;

  bool get obscureText => _obscureText ?? false;

  set obscureText(bool obscure) {
    _obscureText = obscure;
    notifyListeners();
  }

  InputBorder? _inputBorder;

  InputBorder get inputBorder => _inputBorder ?? const UnderlineInputBorder();

  set inputBorder(InputBorder inputBorder) {
    _inputBorder = inputBorder;
    notifyListeners();
  }

  double? _radius;

  double get radius => _radius ?? 4.0;

  set radius(double radius) {
    _radius = radius;
    notifyListeners();
  }
}
