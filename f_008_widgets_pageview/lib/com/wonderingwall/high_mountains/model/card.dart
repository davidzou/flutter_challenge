
// 卡片信息
import 'package:flutter/material.dart';

class CardInfo {
  // 网路图片地址
  String? url;
  // 本地图片
  String path;
  // 名称
  String name;
  // 类型
  Type type;
  // 描述
  String description;

  Color? color;

  CardInfo({this.url, required this.path, required this.name, this.description = "", this.color = Colors.white, this.type = Type.sanshan});
}


enum Type {
  // 属于三山
  sanshan,
  // 属于五岳
  wuyue,
}

final cardList = [
  CardInfo(path: "assets/images/huangshan.jpg", name: "黄山", description: "黄山描述", color: Colors.yellowAccent[400]),
  CardInfo(path: "assets/images/lushan.jpg", name: "庐山", description: "庐山描述", color: Colors.grey),
  CardInfo(path: "assets/images/yandangshan.jpg", name: "雁荡山", description: "雁荡山描述", color: Colors.blueAccent.shade100),
];