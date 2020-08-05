import 'package:f_001_widgets_expanded/expanded_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "",
    theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
        primaryColorLight: Colors.lightBlue,
        disabledColor: Colors.lightBlue,
        unselectedWidgetColor: Colors.lightGreenAccent // CheckBox 外框颜色，为选中状态下
    ),
    home: ExpandedPage(),
  ));
}
