import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'f_015_widgets_row_and_column',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: '015 Row & Column'),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          _buildDropDown(MainAxisSize.values, onChanged: (value) {
            FlexNotifier.instance().mainAxisSize = value!;
          }, initValue: FlexNotifier.instance().mainAxisSize),
          _buildDropDown(MainAxisAlignment.values, onChanged: (value) {
            FlexNotifier.instance().mainAxisAlignment = value!;
          }, initValue: FlexNotifier.instance().mainAxisAlignment),
          _buildDropDown(CrossAxisAlignment.values, onChanged: (value) {
            FlexNotifier.instance().crossAxisAlignment = value!;
          }, initValue: FlexNotifier.instance().crossAxisAlignment),
          const SizedBox(height: 100,),
          Container(decoration: const BoxDecoration(color: Colors.amber), child: const RowWidget()),
        ],
      ),
    );
  }

  _buildDropDown<T>(List<T> items, {ValueChanged? onChanged, T? initValue}) {
    T dynamicValue = initValue ?? items.first;
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            value: dynamicValue,
            items: items.map((e) => DropdownMenuItem(value: e, child: Text(e.toString()))).toList(),
            onChanged: (value) {
              dynamicValue = value as T;
              setState(() {});
              onChanged?.call(value);
            },
          ),
        );
      },
    );
  }
}

class RowWidget extends StatefulWidget {
  const RowWidget({super.key});

  @override
  State<RowWidget> createState() => _RowWidgetState();
}

class _RowWidgetState extends State<RowWidget> {
  @override
  void initState() {
    super.initState();
    FlexNotifier.instance().addListener(_refresh);
  }

  @override
  void dispose() {
    FlexNotifier.instance().removeListener(_refresh);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: FlexNotifier.instance().mainAxisSize,
      mainAxisAlignment: FlexNotifier.instance().mainAxisAlignment,
      crossAxisAlignment: FlexNotifier.instance().crossAxisAlignment,
      children: const [
        Icon(Icons.card_giftcard, size: 32.0),
        Icon(Icons.card_giftcard, size: 80.0),
        Icon(Icons.card_giftcard, size: 48.0),
      ],
    );
  }

  _refresh() {
    setState(() {});
  }
}

class FlexNotifier with ChangeNotifier {
  FlexNotifier._();

  static final FlexNotifier _install = FlexNotifier._();

  factory FlexNotifier.instance() => _install;

  MainAxisSize? _mainAxisSize;

  MainAxisSize get mainAxisSize => _mainAxisSize ?? MainAxisSize.max;

  set mainAxisSize(MainAxisSize size) {
    _mainAxisSize = size;
    notifyListeners();
  }

  MainAxisAlignment? _mainAxisAlignment;

  MainAxisAlignment get mainAxisAlignment => _mainAxisAlignment ?? MainAxisAlignment.center;

  set mainAxisAlignment(MainAxisAlignment mainAxisAlignment) {
    _mainAxisAlignment = mainAxisAlignment;
    notifyListeners();
  }

  CrossAxisAlignment? _crossAxisAlignment;

  CrossAxisAlignment get crossAxisAlignment => _crossAxisAlignment ?? CrossAxisAlignment.center;

  set crossAxisAlignment(CrossAxisAlignment crossAxisAlignment) {
    _crossAxisAlignment = crossAxisAlignment;
    notifyListeners();
  }
}
